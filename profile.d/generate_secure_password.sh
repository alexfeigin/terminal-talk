generate_secure_password() {
    while openssl rand -base64 16 2>/dev/null; do :; done  | grep -Eo -m1 '[A-Za-z]{1}[a-zA-Z0-9]{21}=='
}
export -f generate_secure_password