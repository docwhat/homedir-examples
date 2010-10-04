## -*- sh -*-

function pathman {
    setopt extendedglob
    local append=false
    if [[ "${1}" = '-a' ]]; then
        append=true
        shift
    fi
    local bindir="${1}"
    if [[ -z "${bindir}" ]]; then
        return
    fi
    if [[ -d "${bindir}" && ! "${PATH}" -regex-match "(^|:)${bindir}(\$|:)" ]]; then
        if [[ -z "${PATH}" ]]; then
            PATH="${bindir}"
        elif [[ "${append}" = true ]]; then
            PATH="${PATH}:${bindir}"
        else
            PATH="${bindir}:${PATH}"
        fi
    fi
    local mandir="${bindir/%\/[^\/]##\/#//man}"
    if [[ -d "${mandir}" && ! "${MANPATH}" -regex-match "(^|:)${mandir}(\$|:)" ]]; then
        if [[ -z "${MANPATH}" ]]; then
            MANPATH="${mandir}"
        elif [[ "${append}" = true ]]; then
            MANPATH="${MANPATH}:${mandir}"
        else
            MANPATH="${mandir}:${MANPATH}"
        fi
    fi
    local mandir="${bindir/%\/[^\/]##\/#//share/man}"
    if [[ -d "${mandir}" && ! "${MANPATH}" -regex-match "(^|:)${mandir}(\$|:)" ]]; then
        if [[ -z "${MANPATH}" ]]; then
            MANPATH="${mandir}"
        elif [[ "${append}" = true ]]; then
            MANPATH="${MANPATH}:${mandir}"
        else
            MANPATH="${mandir}:${MANPATH}"
        fi
    fi
    export MANPATH PATH
}

# EOF
