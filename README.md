## 1. Environment

* WSL2(Ubuntu 18.04.4 LTS)
* ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
* Rails 6.0.3.2
* Docker version 19.03.12, build 48a66213fe

## 2. Reference

* [『パーフェクトRuby on Rails【増補改訂版】』](https://gihyo.jp/book/2014/978-4-7741-6516-5)

## 3. Setup

### 3-1. Clone the repository

```bash
$ git clone git@github.com:oasis-forever/perfect_ruby_on_rails.git
```

### 3-2. Install gems

```bash
$ cd perfect_ruby_on_rails
$ bundle
```

### 3-3. Build Docker image

#### 3-3-1. Build

```bash
$ vim ~/.bash_profile
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
```

* Production

```bash
$ docker build -t perfect_ruby_on_rails_production -f Dockerfile-production .
$ docker run -p 3000:3000 rails_experiment
```

* Development

```bash
$ docker build -t perfect_ruby_on_rails_development -f Dockerfile-development .
$ docker volume create perfect_ruby_on_rails_development_bundle
$ docker volume create perfect_ruby_on_rails_development_node_modules
$ docker run -it \
  -v $(pwd):/app \
  -v perfect_ruby_on_rails_development_bundle:/app/vendor/bundle \
  -v perfect_ruby_on_rails_development_node_modules:/app/node_modules \
  -p 3000:3000 \
  perfect_ruby_on_rails_development
# bundle install
# yarn install
# bin/rails s
```

#### 3-3-2. Check if it is sucessfully built

Accesss `localhost:3000` and check if the image below is shown.

![Yay! You're on Ruby on Rails](https://github.com/oasis-forever/rails_experiment/blob/master/public/yay!-you're-on-rails!.png)
