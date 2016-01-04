kubectl create -f kube/image-pull-secret.yml --server="119.81.189.81:8080" || true
kubectl create -f kube/service.yml --server="119.81.189.81:8080" || true
kubectl delete rc {{ project_name }}-server-rc --server="119.81.189.81:8080" || true
kubectl create -f kube/server-rc.yml --server="119.81.189.81:8080"
kubectl get pod --server="119.81.189.81:8080"
