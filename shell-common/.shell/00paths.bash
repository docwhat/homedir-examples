## -*- sh -*-

function pathman {
    local append=false
    if [[ "${1}" = '-a' ]]; then
        append=true
        shift
    fi
    local bindir="${1}"
    if [[ -z "${bindir}" ]]; then
        return
    fi
    if [[ -d "${bindir}" && ! "${PATH}" =~ (^|:)$bindir($|:) ]]; then
        if [[ -z "${PATH}" ]]; then
            PATH="${bindir}"
        elif [[ "${append}" = true ]]; then
            PATH="${PATH}:${bindir}"
        else
            PATH="${bindir}:${PATH}"
        fi
    fi
    if pushd "${bindir}/../man" >/dev/null 2>&1; then
        local mandir="$(pwd)"
        if [[ ! "${MANPATH}" =~ (^|:)$mandir($|:) ]]; then
            if [[ -z "${MANPATH}" ]]; then
                MANPATH="${mandir}"
            elif [[ "${append}" = true ]]; then
                MANPATH="${MANPATH}:${mandir}"
            else
                MANPATH="${mandir}:${MANPATH}"
            fi
        fi
        popd > /dev/null
    fi
    if pushd "${bindir}/../share/man" >/dev/null 2>&1; then
        local mandir="$(pwd)"
        if [[ ! "${MANPATH}" =~ (^|:)$mandir($|:) ]]; then
            if [[ -z "${MANPATH}" ]]; then
                MANPATH="${mandir}"
            elif [[ "${append}" = true ]]; then
                MANPATH="${MANPATH}:${mandir}"
            else
                MANPATH="${mandir}:${MANPATH}"
            fi
        fi
        popd > /dev/null
    fi
}

# EOF
