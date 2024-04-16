build:
	docker build -t mjgray84/ecom-web:v1 .

push:
	docker push mjgray84/ecom-web:v1

create-cm:
	kubectl create configmap db-load-script --from-file=./assets/db-load-script.sql -o yaml --dry-run=client > ./manifests/db-load-script.yaml

deploy:
	kubectl apply -f ./manifests/ns.yaml --namespace=k8s-resume-challenge
	kubectl apply -f ./manifests/db-load-script.yaml --namespace=k8s-resume-challenge
	kubectl apply -f ./manifests/database.yaml --namespace=k8s-resume-challenge
	kubectl apply -f ./manifests/website-deployment.yaml --namespace=k8s-resume-challenge
