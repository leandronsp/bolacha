# bolacha

```
(  ___ \ (  ___  )( \      (  ___  )(  ____ \|\     /|(  ___  )
| (   ) )| (   ) || (      | (   ) || (    \/| )   ( || (   ) |
| (__/ / | |   | || |      | (___) || |      | (___) || (___) |
|  __ (  | |   | || |      |  ___  || |      |  ___  ||  ___  |
| (  \ \ | |   | || |      | (   ) || |      | (   ) || (   ) |
| )___) )| (___) || (____/\| )   ( || (____/\| )   ( || )   ( |
|/ \___/ (_______)(_______/|/     \|(_______/|/     \||/     \|
```

[bolacha](https://github.com/leandronsp/bolacha) is a simple application running on Kubernetes, using Prometheus, Grafana and TektonCI/CD.

## Requirements

- Ruby
- Docker
- Kubernetes

## Development tooling

Make and Docker

## Using make

```bash
$ make help
```
It outputs all the available commands.

## Setup the environment

```bash
$ make setup
$ make nginx.test
$ make nginx.pf
```

Open `http://localhost:4000`

## Monitoring dashboard

```bash
$ make grafana.pf
```

Open `http://localhost:3000`
