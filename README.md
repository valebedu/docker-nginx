# docker-nginx

docker-nginx help you to build applications running with nginx on ubuntu systems.

## Table of Contents

*   [Getting started](#getting_started)
*   [Documentation](#documentation)
*   [Reference](#reference)
*   [Contributing](#contributing)
*   [Licensing](#licensing)
*   [Changelog](#changelog)

## Getting started

### Installation

Be sure Docker is installed on your machine before continuing. To ensure that docker is installed on your machine and running, run the following command.

``` shell
docker --version
```

The image will be downloaded automatically by running a script using it but if you want to download it manually, you can run the following command.

``` shell
docker pull valentinbercot/docker-nginx
```

### How to use

#### Docker run

To run this docker image with `docker run` you just have to run the following command in your terminal.

```shell
docker run --name yourContainerName --detach valentinbercot/docker-nginx
```

You can add the following options to this command to complete your configuration.

*   set a port: `--publish 8080:80`
*   set a content volume: `--volume path/to/www:/var/www`
*   set a configuration volume: `--volume path/to/nginx.conf:/etc/nginx/nginx.conf`

#### Dockerfile

To run this docker image with a dockerfile you should first create a `Dockerfile` as following.

``` dockerfile
FROM valentinbercot/docker-nginx

COPY /path/to/www /var/www
COPY /path/to/nginx.conf /etc/nginx/nginx.conf
COPY /path/to/conf.d/default.conf /etc/nginx/conf.d/default.conf
```

Then build your image.

``` shell
docker build --tag yourName/yourImage .
```

And run it.

``` shell
docker run --name yourContainerName --detach yourName/yourImage
```

#### Docker-compose

To run this docker image with docker-compose you should first create a `docker-compose.yml` as following.

``` yaml
version: '2.0'

services:
    yourComposeName:
        container_name: "yourContainerName"
        image: "valentinbercot/docker-nginx"
        volumes:
            - "/path/to/www:/var/www"
            - "/path/to/nginx.conf:/etc/nginx/nginx.conf"
            - "/path/to/conf.d/default.conf:/etc/nginx/conf.d/default.conf"
        ports:
            - "8080:80"
        command: /bin/bash -c "nginx -g 'daemon off;'"
```

Then build and run your docker-compose.

``` shell
docker-compose up
```

## Documentation

If you want to know more about Docker or Nginx please refer to official documentations in [reference](#reference).

## Reference

*   [Docker][docker]
*   [Nginx][nginx]

## Contributing

You're free to contribute, please fork my project and send me a pull request.

If you want to contribute please be aware of my [CODE OF CONDUCT][code_of_conduct].

## Licensing

This repository is under this [LICENSE][license].

## Changelog

The complete changelog could be found in [CHANGELOG][changelog].

[docker]: https://docker.com
[nginx]: https://nginx.org
[code_of_conduct]: CODE_OF_CONDUCT.md
[license]: LICENSE.md
[changelog]: CHANGELOG.md
