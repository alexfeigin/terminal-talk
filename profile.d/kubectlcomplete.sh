source <(/opt/homebrew/bin/kubectl completion bash)

for i in dev stg us1 eu2 au1 ca1; do
  eval "alias k$i='export KUBECONFIG=\$HOME/.kube/config_$i; kubectl'; complete -o default -F __start_kubectl k$i"
done
