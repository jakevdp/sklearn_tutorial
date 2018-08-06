SHELL=/bin/bash

args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

%:
	@:

build:
	@docker build . -t jupyter-lab
	@make run

run:
	@docker run -it -d -v $(PWD):/home/dev/app -p 127.0.0.1:8888:8888 --name sklearn-lab jupyter-lab

start:
	@docker start sklearn-lab

stop:
	@docker stop sklearn-lab

remove:
	@docker rm -f sklearn-lab

bash:
	@docker exec -it --user dev sklearn-lab bash
