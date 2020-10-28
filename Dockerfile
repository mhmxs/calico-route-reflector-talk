FROM ubuntu:latest

WORKDIR /content

RUN apt update && apt install -y imagemagick gifsicle gawk curl fonts-freefont-ttf ttf-dejavu && apt clean
RUN curl -sLo /usr/local/bin/gifterminal.sh https://raw.githubusercontent.com/kinvolk/gifterminal/kai/fonts-and-paths/gifterminal.sh && chmod +x /usr/local/bin/gifterminal.sh
RUN sed -i 's/fold --characters/fold/' /usr/local/bin/gifterminal.sh