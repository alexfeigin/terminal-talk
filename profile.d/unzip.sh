unzipd() {
	dir=$(basename "$1" .${1##*.})
	unzip "$1" -d $dir
}

export -f unzipd


