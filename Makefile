#!make
include .env

build-app:
	@docker-compose up -d --build
	@docker exec -it ${APP_NAME}-php-fpm bash -c "composer install --no-interaction --prefer-source"
	@docker exec -it ${APP_NAME}-php-fpm bash -c "php artisan key:generate"

up:
	@docker-compose up -d

down:
	@docker-compose down

composer-install: ## Run composer install inside container app
	@docker exec ${APP_NAME}-php-fpm bash -c "composer install --no-interaction --prefer-source"

composer-update: ## Run composer update inside container app
	@docker exec ${APP_NAME}-php-fpm bash -c "composer update --no-interaction --prefer-source"

console-app:
	@docker exec -it ${APP_NAME}-php-fpm bash
