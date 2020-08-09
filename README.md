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

## 4. DB Setup

### 4-1. Create and grant the `app` user in MySql

#### 4-1-1. Setup components

```bash
$ docker-compose up -d
```

#### 4-1-2. Sign in Mysql with root user

```bash
$ docker-compose exec mysql mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.21 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

#### 4-1-3. Create and grant `app`@'%' user

```sql
mysql> CREATE DATABASE perfect_ruby_on_rails_development CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
Query OK, 1 row affected (0.24 sec)

mysql> CREATE DATABASE perfect_ruby_on_rails_test CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
Query OK, 1 row affected (0.34 sec)

mysql> CREATE USER 'app'@'%' IDENTIFIED BY 'password';
Query OK, 0 rows affected (0.19 sec)

mysql> GRANT ALL on perfect_ruby_on_rails_development.* TO 'app'@'%';
Query OK, 0 rows affected (0.23 sec)

mysql> GRANT ALL on perfect_ruby_on_rails_test.* TO 'app'@'%';
Query OK, 0 rows affected (0.16 sec)

mysql> select user, host from mysql.user;
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| app              | %         |
| healthchecker    | localhost |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
+------------------+-----------+
6 rows in set (0.00 sec)
```

The `%` allows connections to all server, it is very strong.

## 5. Operate SQL with Rails command via ports mapping

## 5-1. Connet NySql from HostOS with `--servive-port` option

```bash
$ dokcer-comppose run --servive-port app
# bundle
root@32d5477e5f44:/app# bundle
The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
Using rake 13.0.1
Using concurrent-ruby 1.1.6
Using i18n 1.8.5
Using minitest 5.14.1
Using thread_safe 0.3.6
Using tzinfo 1.2.7
Using zeitwerk 2.4.0
Using activesupport 6.0.3.2
Using builder 3.2.4
Using erubi 1.9.0
Using mini_portile2 2.4.0
Using nokogiri 1.10.10
Using rails-dom-testing 2.0.3
Using crass 1.0.6
Using loofah 2.6.0
Using rails-html-sanitizer 1.3.0
Using actionview 6.0.3.2
Using rack 2.2.3
Using rack-test 1.1.0
Using actionpack 6.0.3.2
Using nio4r 2.5.2
Using websocket-extensions 0.1.5
Using websocket-driver 0.7.3
Using actioncable 6.0.3.2
Using globalid 0.4.2
Using activejob 6.0.3.2
Using activemodel 6.0.3.2
Using activerecord 6.0.3.2
Using mimemagic 0.3.5
Using marcel 0.3.3
Using activestorage 6.0.3.2
Using mini_mime 1.0.2
Using mail 2.7.1
Using actionmailbox 6.0.3.2
Using actionmailer 6.0.3.2
Using actiontext 6.0.3.2
Using public_suffix 4.0.5
Using addressable 2.7.0
Using bindex 0.8.1
Using msgpack 1.3.3
Using bootsnap 1.4.7
Using bundler 2.1.4
Using byebug 11.1.3
Using regexp_parser 1.7.1
Using xpath 3.2.0
Using capybara 3.33.0
Using childprocess 3.0.0
Using ffi 1.13.1
Using jbuilder 2.10.0
Using rb-fsevent 0.10.4
Using rb-inotify 0.10.1
Using listen 3.2.1
Using method_source 1.0.0
Using mysql2 0.5.3
Using puma 4.3.5
Using rack-proxy 0.6.5
Using thor 1.0.1
Using railties 6.0.3.2
Using sprockets 4.0.2
Using sprockets-rails 3.2.1
Using rails 6.0.3.2
Using rubyzip 2.3.0
Using sassc 2.4.0
Using tilt 2.0.10
Using sassc-rails 2.1.2
Using sass-rails 6.0.0
Using selenium-webdriver 3.142.7
Using spring 2.1.0
Using spring-watcher-listen 2.0.1
Using turbolinks-source 5.2.0
Using turbolinks 5.2.1
Using web-console 4.0.4
Using webdrivers 4.4.1
Using webpacker 4.2.2
Bundle complete! 17 Gemfile dependencies, 74 gems now installed.
Bundled gems are installed into `./vendor/bundle`
```

## 5-1. Behavioural test

### 5-2-1. Generate scaffold for test

```bash
# bin/rails g scaffold user user:string age:integer
Running via Spring preloader in process 123
      invoke  active_record
      create    db/migrate/20200809151001_create_users.rb
      create    app/models/user.rb
      invoke    test_unit
      create      test/models/user_test.rb
      create      test/fixtures/users.yml
      invoke  resource_route
       route    resources :users
      invoke  scaffold_controller
      create    app/controllers/users_controller.rb
      invoke    erb
       exist      app/views/users
      create      app/views/users/index.html.erb
      create      app/views/users/edit.html.erb
      create      app/views/users/show.html.erb
      create      app/views/users/new.html.erb
      create      app/views/users/_form.html.erb
      invoke    test_unit
      create      test/controllers/users_controller_test.rb
      create      test/system/users_test.rb
      invoke    helper
      create      app/helpers/users_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/users/index.json.jbuilder
      create      app/views/users/show.json.jbuilder
      create      app/views/users/_user.json.jbuilder
      invoke  assets
      invoke    scss
      create      app/assets/stylesheets/users.scss
      invoke  scss
      create    app/assets/stylesheets/scaffolds.scss
```

### 5-2-2. Migrate to DB

```bash
# bin/rails db:migrate
== 20200809151001 CreateUsers: migrating ======================================
-- create_table(:users)
   -> 2.0853s
== 20200809151001 CreateUsers: migrated (2.0855s) =============================
```

### 5-2-3. Restore


```bash
# bin/rails g scaffold user
Running via Spring preloader in process 180
      invoke  active_record
      remove    db/migrate/20200809151001_create_users.rb
      remove    app/models/user.rb
      invoke    test_unit
      remove      test/models/user_test.rb
      remove      test/fixtures/users.yml
      invoke  resource_route
       route    resources :users
      invoke  scaffold_controller
      remove    app/controllers/users_controller.rb
      invoke    erb
      remove      app/views/users
      remove      app/views/users/index.html.erb
      remove      app/views/users/edit.html.erb
      remove      app/views/users/show.html.erb
      remove      app/views/users/new.html.erb
      remove      app/views/users/_form.html.erb
      invoke    test_unit
      remove      test/controllers/users_controller_test.rb
      remove      test/system/users_test.rb
      invoke    helper
      remove      app/helpers/users_helper.rb
      invoke      test_unit
      invoke    jbuilder
      remove      app/views/users
      remove      app/views/users/index.json.jbuilder
      remove      app/views/users/show.json.jbuilder
      remove      app/views/users/_user.json.jbuilder
      invoke  assets
      invoke    scss
      remove      app/assets/stylesheets/users.scss
      invoke  scss
# bin/rails db:migrate:reset
Dropped database 'perfect_ruby_on_rails_development'
Dropped database 'perfect_ruby_on_rails_test'
Created database 'perfect_ruby_on_rails_development'
Created database 'perfect_ruby_on_rails_test'
```
