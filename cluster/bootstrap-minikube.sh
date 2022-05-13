minikube start --driver=hyperkit --container-runtime=containerd --cni=calico --bootstrapper=kubeadm --kubernetes-version=1.21.4 --addons=metallb --cpus=8 --memory=12gb --profile cluster1

kubectl --context cluster1 apply -f cluster/metallb-c1.yaml

kubectl config use-context cluster1

