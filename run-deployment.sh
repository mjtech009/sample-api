#!/bin/bash -e
apply_and_wait() {
  local manifest=$1
  kubectl apply -f "$manifest"
    local deployment_name=$(grep -E '^  name:' "$manifest" | head -n 1 | awk '{print $2}')
    kubectl rollout status deployment/"$deployment_name"
}

# Main script execution
if [ "$1" == "v1" ]; then
  apply_and_wait "v1-k8s-manifest.yaml"
elif [ "$1" == "v2" ]; then
  apply_and_wait "v2-k8s-manifest.yaml"
else
  apply_and_wait "v1-k8s-manifest.yaml"
  apply_and_wait "v2-k8s-manifest.yaml"
fi
