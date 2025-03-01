#!/bin/bash

jsonify() {
  local json="{}"

  while (("$#")); do
    local key="${1#-}" # Remove the hyphen prefix

    if [[ "$key" == "help" ]] || [[ "$key" == "-help" ]] || [[ "$key" == "h" ]]; then
      echo "Usage: jsonify [-key1 value1] [-key2 value2] ..."
      return 0
    fi

    if [[ "$key" =~ ^-.* ]]; then
      echo "Invalid option: $key"
      return 1
    fi

    if [[ "$2" == -* || -z "$2" ]]; then
      echo "Missing value for key: $key"
      return 1
    fi

    local value="$2"
    json=$(jq -c --arg key "$key" --arg value "$value" '. + { ($key): $value }' <<<"$json")
    shift 2
  done

  echo "$json"
}

# jqpaths - List all unique paths in a json passed through stdin, in a format that can be used with jq
jqpaths() {
  #  jq -r \                                        # Run jq in raw mode
  #        '[                                       # Start an array
  #            paths |                              # get arrays of parts of all paths
  #            map(select(type=="string")//"[]") |  # if part of path is not a string, replace with [] represent array
  #            "."+join(".")                        # take all parts of path and join them with ".", add a leading "."
  #         ] |                                     # End the array
  #         sort |                                  # sort the array of paths
  #         unique |                                # get unique paths
  #         .[]'                                    # flatten the array
  jq -r '[paths|map(select(type=="string")//"[]")|"."+join(".")]|sort|unique|.[]'
}

# jqselectpath - uses jqpaths with fzf to interactively select a jq path and run jq on it
jqselectpath() {
  tmp=$(mktemp stdin_XXXXXXXX.json)
  cat >$tmp
  jqpath=$(cat $tmp | jqpaths | fzf --height=40% --layout=reverse --border)
  echo "jq -r '${jqpath}'"
  cat $tmp | jq -r $jqpath
  [[ "$1" != "-keep" ]] && rm $tmp || printf '\n%s\n' "keeping stdin in temp file: ${tmp}"
}
