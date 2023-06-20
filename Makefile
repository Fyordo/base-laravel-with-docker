#!make
include .env

build:
	@docker-compose up -d --build

up:
	@docker-compose up -d

composer-install: ## Run composer install inside container app
	@docker exec organic-market-api-php-fpm-1 bash -c "composer install --no-interaction --prefer-source"

composer-update: ## Run composer update inside container app
	@docker exec organic-market-api-php-fpm-1 bash -c "composer update --no-interaction --prefer-source"

console-app:
	@docker exec -it organic-market-api-php-fpm-1 bash