SRC=$(wildcard *.txt)
DST=$(SRC:.txt=.gif)

all: deps $(DST)

deps:
	docker build -t mhmxs/gifterminal:latest .

%.gif: %.txt
	@#USER_NS='-u $(shell id -u $(whoami)):$(shell id -g $(whoami))'
	docker run --rm -it ${USER_NS} -w /content -v $(PWD):/content mhmxs/gifterminal:latest gifterminal.sh $< out/$@

_gen-ips:
	nmap -sL -n 10.10.64.0/16 | awk '/Nmap scan report/{print $$NF}'