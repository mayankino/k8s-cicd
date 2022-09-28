#!/bin/sh

echo "Initializing Kustomize...."

#Kustomize init in root
kustomize init && mkdir -p base/apps && mkdir -p overlays 

cd base/ && kustomize init

cd ../

#Add resources to root kustomize
cat <<'EOF' > ./kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- base/
EOF

./install_argocd.sh