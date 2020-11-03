# TripleA Docker
Docker image for running the [TripleA board game engine](https://triplea-game.org/) version 2.0 and greater in bot mode.

### Building
Already built images can be found on Docker Hub at [bacrossland/triplea](https://hub.docker.com/r/bacrossland/triplea).

To build this Docker image locally, run the follow:

`$ docker build -t <image_name> .`

### Running
This docker image uses Docker Volumes to store downloaded maps, saved games, and logs. Whatever Docker host you used to 
run TripleA Docker must support Docker Volumes. The container uses two volumes, one for the downloaded maps and one for
saved games. This allows you to share maps between containers while keeping saved games isolated.

To run the container use the following format:

`
$ docker run -d --rm --name <name_of_container> -v <name_of_volume>:/opt/triplea/downloadedMaps -v <name_of_volume>:/opt/triplea/savedGames -p 3300:3300 <image_name> run_bot -u <username>
`

example:

`
$ docker run -d --rm --name triplea -v triplea-downloadedMaps:/opt/triplea/downloadedMaps -v triplea-savedGames:/opt/triplea/savedGames -p 3300:3300 bacrossland/triplea:latest run_bot -u RandoUser
`

If you want to use a different port than 3300, you will need to specify that for Docker and run_bot.

`
$ docker run -d --rm --name <name_of_container> -v <name_of_volume>:/opt/triplea/downloadedMaps -v <name_of_volume>:/opt/triplea/savedGames -p <port_you_want_to_use>:<port_you_want_to_use> <image_name> run_bot -u <username> -p <port_you_want_to_use>
`

example:

`
$ docker run --rm --name triplea -v triplea-downloadedMaps:/opt/triplea/downloadedMaps -v triplea-savedGames:/opt/triplea/savedGames -p 3400:3400 bacrossland/triplea:latest run_bot -u RandoUser -p 3400
`

Additional run_bot options are below. You can also get them by running the container with no options specified.

```
Usage:  run_bot <-u username> [OPTIONS]

A TripleA bot runner

Options:
   -b, --bot_name                  Name the bot uses in the lobby (default "Bot_{username}_{port}")
   -h, --help                      Display this help and exit
   -l, --lobby                     Hostname of the lobby to which the bot will connect (default "https://lobby.triplea-game.org")
   -p, --port                      Port to run the bot on (default 3300)
   -u, --username                  Your TripleA Username
```