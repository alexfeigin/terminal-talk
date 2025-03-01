function calcpath() {
  path_cache="$HOME/.path_cache"
  current_time=$(date +%s)
  [[ -f "${path_cache}" ]] && file_time=$(date -r "${path_cache}" +%s) || file_time=0
  if (( file_time < (current_time - ( 60 * 60 * 24 ))  )); then
    (
      flock -x -w 10 200 || exit 1
      [[ -f "${path_cache}" ]] && file_time=$(date -r "${path_cache}" +%s) || file_time=0
      if (( file_time < (current_time - ( 60 * 60 * 24 ))  )); then
         build_path='/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
         build_path=/usr/local/share/python:${build_path}
         build_path="${KREW_ROOT:-$HOME/.krew}/bin:${build_path}"
         build_path=${build_path}:$HOME/sources/do-scripts/ci_scripts
         build_path=${build_path}:$HOME/.rd/bin/
         for i in $(find /usr/local/opt -maxdepth 3 -type d -follow -name gnubin); do p=$i:$p; done
         build_path=${p}${build_path}
         echo ${build_path} > "${path_cache}"
       fi
    ) 200>"${path_cache}.lock"
    fi
    export PATH=$(cat "${path_cache}")
}