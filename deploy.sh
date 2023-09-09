docker build -t anilkom/complex-react-gcp-client:latest -t anilkom/complex-react-gcp-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t anilkom/complex-react-gcp-server:latest -t anilkom/complex-react-gcp-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t anilkom/complex-react-gcp-worker:latest -t anilkom/complex-react-gcp-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push -a anilkom/complex-react-gcp-client
docker push -a anilkom/complex-react-gcp-server
docker push -a anilkom/complex-react-gcp-worker
kubectl apply -f k8s
kubectl set image deployment/server-deployment server=anilkom/complex-react-gcp-server:$GIT_SHA
kubectl set image deployment/client-deployment server=anilkom/complex-react-gcp-client:$GIT_SHA
kubectl set image deployment/worker-deployment server=anilkom/complex-react-gcp-worker:$GIT_SHA