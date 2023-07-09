# swoole-4.6.0-php7.4-alpine

## Usage

Create project

```sh
# change demo-service to your project
mkdir demo-service && cd demo-service
```

The run the image
```docker
docker run -v ${PWD}:/var/www/ -i -t --rm shundevhub/swoole-4.6.0-php7.4-alpine sh
```

You can set alias
```sh
alias swoole='docker run -v "$(pwd)":/var/www/ -i -t --rm shundevhub/swoole-4.6.0-php7.4-alpine sh'
```


### For Hyperf

Create project

```sh
# pwd /var/www
composer create-project hyperf/hyperf-skeleton . 'specified version'
# e.g.
composer create-project hyperf/hyperf-skeleton . 2.2
```

The you can create a Hyperf project.
