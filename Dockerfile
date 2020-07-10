FROM openjdk:11
ARG version=2.1.20365

WORKDIR /opt
RUN wget https://github.com/triplea-game/triplea/releases/download/${version}/triplea-game-headless-${version}.zip && \
unzip triplea-game-headless-${version}.zip && rm triplea-game-headless-${version}.zip && rm run_bot*

RUN mkdir -p triplea/downloadedMaps && mkdir -p triplea/savedGames
COPY run_bot /usr/bin
RUN chmod +x /usr/bin/run_bot

VOLUME ["/opt/triplea/downloadedMaps","/opt/triplea/savedGames"]

CMD ["run_bot", "--help"]