## -*- sh -*-

function pathman {
    setopt extendedglob
    local append=false
    local force=false
    local -aU new_paths
    new_paths=()

    PATH="${PATH:-}"
    MANPATH="${MANPATH:-}"

    while (( $# > 0 )); do
	case "$1" in
	    -f|--force) force=true ;;
	    -a|--append) append=true ;;
	    -*)
		echo "Invalid flag: $1"
		return 1
		;;
	    *)
		new_paths=( "$1" $new_paths[*])
		;;
	esac
	shift
    done

    ## add to PATH
    local new_path
    for new_path in "${new_paths[@]}"; do
	if [[ -d "${new_path}" ]]; then
	    if [[ "${force}" = true ]]; then
	        # Remove any existing versions of new_path
		local -a tmp
		path=("${(@)path:#${new_path}}")
	    elif [[ ${path[(i)${new_path}]} -le ${#path} ]]; then
		# Skip, it already exists
		continue
	    fi
	    # Add the new_path
	    if [[ -z "${PATH}" ]]; then
		PATH="${new_path}"
	    elif [[ "${append}" = true ]]; then
		PATH="${PATH}:${new_path}"
	    else
		PATH="${new_path}:${PATH}"
	    fi
	fi
	for mandir in "${new_path/%\/[^\/]##\/#//man}" "${new_path/%\/[^\/]##\/#//share/man}"; do
	    if [[ -d "${mandir}" ]]; then
		if [[ "${force}" = true ]]; then
    	            # Remove any existing versions of mandir
		    manpath=("${(@)manpath:#${mandir}}")
		elif [[ ${manpath[(i)${mandir}]} -le ${#manpath} ]]; then
		    # Skip, it already exists
		    continue
		fi
	        # Add the new_path
		if [[ -z "${MANPATH}" ]]; then
		    MANPATH="${manpath}"
		elif [[ "${append}" = true ]]; then
		    MANPATH="${MANPATH}:${mandir}"
		else
		    MANPATH="${mandir}:${MANPATH}"
		fi
	    fi
	done
    done

    export PATH MANPATH
}

# EOF
