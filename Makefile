all:
	@cd srcs; docker-compose up --build

stop:
	@cd srcs; docker-compose --project-directory srcs down

clean:
	@docker rm -f $(docker ps -aq)

fclean:
	@docker system prune -a
	@docker volume rm -rf $(docker volume ls -q) &> /dev/null ; true
	@docker network rm -rf $(docker network ls -q) &> /dev/null ; true

re: fclean all