minikube start --driver=hyperkit --feature-gates=EphemeralContainers=true --container-runtime=containerd --cni=calico --bootstrapper=kubeadm --kubernetes-version=1.23.3 --addons=metallb --cpus=8 --memory=12gb --profile cluster1

kubectl --context cluster1 apply -f metallb-c1.yaml

kubectl config use-context cluster1

