FROM docker/whalesay:latest
RUN apt-get -y update && apt-get install -y fortune
RUN apt-get install -y cowsay
CMD /usr/games/fortune | /usr/games/cowsay