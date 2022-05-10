minikube start --driver=hyperkit --feature-gates=EphemeralContainers=true --container-runtime=containerd --cni=calico --bootstrapper=kubeadm --kubernetes-version=1.23.3 --addons=metallb --cpus=6 --memory=12gb --profile mgmt
minikube start --driver=hyperkit --feature-gates=EphemeralContainers=true --container-runtime=containerd --cni=calico --bootstrapper=kubeadm --kubernetes-version=1.23.3 --addons=metallb --cpus=6 --memory=12gb --nodes 3 --profile cluster1
minikube start --driver=hyperkit --feature-gates=EphemeralContainers=true --container-runtime=containerd --cni=calico --bootstrapper=kubeadm --kubernetes-version=1.23.3 --addons=metallb --cpus=6 --memory=12gb --nodes 3 --profile cluster2

kubectl --context mgmt apply -f metallb-mgmt.yaml
kubectl --context cluster1 apply -f metallb-c1.yaml
kubectl --context cluster2 apply -f metallb-c2.yaml

kubectl --context mgmt label nodes mgmt topology.kubernetes.io/region=local-east-1
kubectl --context cluster1 label nodes cluster1 topology.kubernetes.io/region=local-west-1
kubectl --context cluster2 label nodes cluster2 topology.kubernetes.io/region=local-central-1

kubectl config use-context mgmt
