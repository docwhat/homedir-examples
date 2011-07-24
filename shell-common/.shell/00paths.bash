## -*- sh -*-

function pathman {
    local append=false
    local force=false
    local -a new_paths=()

    while (( $# > 0 )); do
	case "$1" in
	    -f|--force) force=true ;;
	    -a|--append) append=true ;;
	    -*)
		echo "Invalid flag: $1"
		return 1
		;;
	    *)
		if [[ ${#new_paths[*]} -gt 0 ]]; then
		    new_paths=( "${new_paths[@]}" "$1" )
		else
		    new_paths=( "$1" )
		fi
		;;
	esac
	shift
    done

    ## add to PATH
    local new_path
    for new_path in "${new_paths[@]}"; do
	if [[ -d "$new_path" ]]; then
	    if [[ "${PATH}" =~ (^|:)$new_path($|:) ]]; then
		if [[ "${force}" = true ]]; then
	            # Remove any existing versions of new_path
		    # ...or we would, if this was a decent shell...
		    local work=:$PATH:
		    work=${work/:$new_path:/:}
		    work=${work%:}
		    work=${work#:}
		    PATH=$work
		else
		    # Skip, it already exists
		    continue
		 fi
	    fi
            if [[ -z "${PATH}" ]]; then
		PATH="${new_path}"
            elif [[ "${append}" = true ]]; then
		PATH="${PATH}:${new_path}"
            else
		PATH="${new_path}:${PATH}"
            fi
	fi

	local dir
	for dir in "../man" "../share/man"; do
	    if pushd "${new_path}/${dir}" >/dev/null 2>&1; then
		mandir=$(pwd)
		if [[ "${MANPATH}" =~ (^|:)$mandir($|:) ]]; then
		    if [[ "${force}" = true ]]; then
	                # Remove any existing versions of new_path
			local work=:$MANPATH:
			work=${work/:$mandir:/:}
			work=${work%:}
			work=${work#:}
			MANPATH=$work
		    else
		        # Skip, it already exists
			continue
		    fi
		fi
		if [[ -z "${MANPATH}" ]]; then
		    MANPATH="${mandir}"
		elif [[ "${append}" = true ]]; then
		    MANPATH="${MANPATH}:${mandir}"
		else
		    MANPATH="${mandir}:${MANPATH}"
		fi
		popd > /dev/null
	    fi
	done
    done
}

# EOF
