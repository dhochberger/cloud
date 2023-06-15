helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack

kubectl --namespace default get pods -l "release=prometheus"

### accéder à grafana 
kubectl logs prometheus-grafana-6948f99bb5-vp4wc -c grafana
# logger=http.server t=2022-06-18T12:44:38.66+0000 lvl=info msg="HTTP Server Listen" address=[::]:3000 protocol=http subUrl= socket=
# logger=sqlstore t=2022-06-18T12:44:38.51+0000 lvl=info msg="Created default admin" user=admin
kubectl port-forward deployment/prometheus-grafana 3000 #grafana
kubectl port-forward deployment/prometheus-kube-prometheus-operator 9090 #prometheus