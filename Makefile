all:
	@docker-compose -f srcs/docker-compose.yml up --build

stop:
	@docker-compose -f srcs/docker-compose.yml down

clean:
	@docker rm -f $(docker ps -aq)

fclean:
	@docker system prune -a
	@docker volume rm -f $(docker volume ls -q) &> /dev/null ; true
	@docker network rm -f $(docker network ls -q) &> /dev/null ; true

re: fclean all