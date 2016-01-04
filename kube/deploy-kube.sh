kubectl create -f kube/image-pull-secret.yaml --server="119.81.189.81:8080" || true
kubectl create -f kube/service.yaml --server="119.81.189.81:8080" || true
kubectl delete rc {{ project_name }}-server-rc --server="119.81.189.81:8080" || true
kubectl create -f kube/server-rc.yaml --server="119.81.189.81:8080"
kubectl get pod --server="119.81.189.81:8080"
