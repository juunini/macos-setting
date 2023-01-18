brew install hyperkit minikube docker docker-compose kubernetes-cli &&\
minikube start &&\
eval $(minikube docker-env) &&\
echo "`minikube ip` minikube.local" | sudo tee -a /etc/hosts
