minikube start --driver=hyperkit --feature-gates=EphemeralContainers=true --container-runtime=containerd --cni=calico --bootstrapper=kubeadm --kubernetes-version=1.23.3 --addons=metallb --cpus=15 --memory=25gb --disk-size=400gb --profile cluster1

kubectl --context cluster1 apply -f metallb-c1.yaml
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.yaml

kubectl config use-context cluster1

