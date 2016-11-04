build:
	docker-compose -f docker-compose.yml -f docker-compose.build.yml up

docker-start:
	docker-machine start default

run:
	docker-compose up

ssh-production:
	gcloud compute --project "ghost-blog-145617" ssh --zone "us-central1-f" "ghost-1-vm"

update-production:
	bin/deploy_theme.sh
