#jdk() {
#        version=$1
#        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
#} # /usr/libexec/java_home is just too slow

jdk() {
    version="${1//1.8/8}"
    JAVA_HOME=$(find /Library/Java/JavaVirtualMachines/ -name Home | grep -v graal | grep "$version" | head -1)
    if [[ -z "$JAVA_HOME" ]]; then
        JAVA_HOME=$(find /Library/Java/JavaVirtualMachines/ -name Home | grep -v graal | sort -V --reverse | head -1)
    fi
    export JAVA_HOME
}

_jdk_completion(){
        if [[ ${COMP_CWORD} -gt 1 ]]; then COMPREPLY=(); return 0; exit; fi
        cur="${COMP_WORDS[COMP_CWORD]}"
        opts=$(find /Library/Java/JavaVirtualMachines/ -name Home | grep -v graal | grep -Eo [0-9]+)
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
}
complete -F _jdk_completion "jdk"
export -f jdk
