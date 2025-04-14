sudo apt install gnome-terminal
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
sudo snap install helm --classic
helm repo add nfs-ganesha-server-and-external-provisioner https://kubernetes-sigs.github.io/nfs-ganesha-server-and-external-provisioner/
minikube start
helm install lscnfs-provisioner charts/nfs-server-provisioner -f ./values.yaml
kubectl apply -f pvc.yaml
kubectl apply -f deployment.yaml
kubectl apply -f job.yaml
kubectl apply -f service.yaml
minikube service lscservice --url