#!/usr/bin/env bash

curl -fsSL https://raw.githubusercontent.com/alexfeigin/terminal-talk/refs/heads/master/profile.d/bash_profile.sh -o ~/.bash_profile
cat <<EOF > ~/.bashrc
if [ -f ~/.bash_profile ]; then
. ~/.bash_profile
fi
EOF

if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
curl -fsSL "https://raw.githubusercontent.com/alexfeigin/terminal-talk/refs/heads/master/Brewfile" -o Brewfile
brew tap homebrew/bundle
brew bundle Brewfile

sudo mkdir -p /usr/local/etc/profile.d
for file in awshelper.sh calcpath.sh curlutils.sh fzf.sh generate_secure_password.sh idea.sh jdk.sh json_helpers.sh kubectlcomplete.sh passcopy.sh sources.sh unzip.sh; do
  sudo curl -fsSL "https://raw.githubusercontent.com/alexfeigin/terminal-talk/refs/heads/master/profile.d/${file}" -o "${file}"
done
