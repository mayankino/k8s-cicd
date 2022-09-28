#!/bin/sh

echo "Creating namespace for ArgoCD...."

#Create namespace for ArgoCD
touch argocd-ns.yaml
cat <<'EOF' > ./argocd-ns.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: argocd
  labels:
    name: argocd
EOF
kubectl apply -f ./argocd-ns.yaml
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml