function calcpath() {
  path_cache="$HOME/.path_cache"
  current_time=$(date +%s)
  [[ -f "${path_cache}" ]] && file_time=$(date -r "${path_cache}" +%s) || file_time=0
  if (( file_time < (current_time - ( 60 * 60 * 24 ))  )); then
    (
      /opt/homebrew/bin/flock -x -w 10 200 || exit 1
      [[ -f "${path_cache}" ]] && file_time=$(date -r "${path_cache}" +%s) || file_time=0
      if (( file_time < (current_time - ( 60 * 60 * 24 ))  )); then
         build_path="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Applications/iTerm.app/Contents/Resources/utilities"
         build_path=/usr/local/share/python:${build_path}
         build_path="${KREW_ROOT:-$HOME/.krew}/bin:${build_path}"
         build_path=${build_path}:$HOME/sources/do-scripts/ci_scripts
         build_path=${build_path}:$HOME/.rd/bin/

         if [ -f /opt/homebrew/bin/brew ]; then
             for i in $(find /opt/homebrew/opt -maxdepth 3 -type d -follow -name gnubin); do p=$i:$p; done
         fi
         if [ -f /usr/local/bin/brew ]; then
             for i in $(find /usr/local/bin -maxdepth 3 -type d -follow -name gnubin); do p=$i:$p; done
         fi
         build_path=${p}${build_path}
         echo ${build_path} > "${path_cache}"
       fi
    ) 200>"${path_cache}.lock"
    fi
    export PATH=$(cat "${path_cache}")
}