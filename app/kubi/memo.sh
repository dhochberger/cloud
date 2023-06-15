docker-compose up --build -d
docker login -u your_docker_hub_username

#clean
kubectl delete namespace deploy
kubectl delete pv mysql-pv-volume
kubectl delete pv rabbitmq-pv-volume

### Deployer le chart
helm install --debug appv1 ./kubi -f ./kubi/Values.yaml --namespace=deploy --create-namespace
# kubectl create namespace deploy
kubectl get all --namespace=deploy
kubectl delete namespace deploy

#liste des volumes
kubectl get pvc,pv -n test

## Accéder aux logs
cd /var/log/containers
ls # list des fichiers logs
kubectl describe pods <NOM>
kubectl logs <NOM_DU_PODS>