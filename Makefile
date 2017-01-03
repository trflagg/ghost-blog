build:
	docker-compose -f docker-compose.yml -f docker-compose.build.yml up

docker-start:
	docker-machine start default

run:
	docker-compose up

ssh-production:
	gcloud compute --project "blog-154502" ssh --zone "us-east1-d" "blog-vm"

update-production:
	bin/deploy_theme.sh
