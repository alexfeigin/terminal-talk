#!/usr/bin/env bash

curl -fsSL https://raw.githubusercontent.com/alexfeigin/terminal-talk/refs/heads/master/profile.d/bash_profile.sh -o ~/.bash_profile

brew install coreutils jq awscli vault fzf flock bat fd btop tmux git tlrc bash-completion

sudo mkdir -p /usr/local/etc/profile.d
for file in awshelper.sh calcpath.sh curlutils.sh fzf.sh generate_secure_password.sh idea.sh jdk.sh json_helpers.sh kubectlcomplete.sh passcopy.sh sources.sh unzip.sh; do
  sudo curl -fsSL "https://raw.githubusercontent.com/alexfeigin/terminal-talk/refs/heads/master/profile.d/${file}" -o "/usr/local/etc/profile.d/${file}"
done

cat <<EOF > ~/.bashrc
if [ -f ~/.bash_profile ]; then
. ~/.bash_profile
fi
EOF

