FROM openjdk:11
ARG version=2.2.0

WORKDIR /opt
COPY triplea-game-headless-${version}.zip .
RUN unzip triplea-game-headless-${version}.zip && rm triplea-game-headless-${version}.zip && rm run_bot*

RUN mkdir -p triplea/downloadedMaps && mkdir -p triplea/savedGames && mkdir -p triplea/savedGames/logs
COPY run_bot /usr/bin
RUN chmod +x /usr/bin/run_bot

VOLUME ["/opt/triplea/downloadedMaps","/opt/triplea/savedGames"]

CMD ["run_bot", "--help"]