## -*- sh -*-

function pathman {
  setopt extendedglob
  local append=false
  local -aU new_paths
  new_paths=()

  PATH="${PATH:-}"
  MANPATH="${MANPATH:-}"

  if [[ $# = 0 ]]; then
    echo "Usage: $0 [-a|--append] DIR [DIR...]"
    return 0
  fi

  while (( $# > 0 )); do
    case "$1" in
      -f|--force) ;; # Compatability, ignored
      -a|--append) append=true ;;
      -h|--help) pathman ; return 0 ;;
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
      if [[ "${append}" != true ]]; then
        # Remove from path
        path=("${(@)path:#$new_path}")
      fi
      # Add the new_path
      if [[ "${append}" = true ]]; then
        path+=("${new_path}")
      else
        PATH="${new_path}:${PATH}"
      fi
    fi
    for mandir in "${new_path/%\/[^\/]##\/#//man}" "${new_path/%\/[^\/]##\/#//share/man}"; do
      if [[ -d "${mandir}" ]]; then
        if [[ "${append}" != true ]]; then
          # Remove from manpath
          manpath=("${(@)manpath:#$new_path}")
        fi
        # Add the new_path
        if [[ "${append}" = true ]]; then
          manpath+=("${mandir}")
        else
          MANPATH="${mandir}:${MANPATH}"
        fi
      fi
    done
  done

  typeset -U path manpath
  export PATH MANPATH
}

# EOF
