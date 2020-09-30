## 1. Environment

* WSL2(Ubuntu 20.04.1 LTS)
* ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
* Rails 6.0.3.2
* Docker version 19.03.12, build 48a66213fe

## 2. Reference

* [『パーフェクトRuby on Rails【増補改訂版】』](https://gihyo.jp/book/2014/978-4-7741-6516-5)

## 3. Clone the repository

```bash
$ git clone git@github.com:oasis-forever/perfect_ruby_on_rails.git
```

## 4. Docker

### 4-1. Build constainers

* Build container of `db` and `app`

```bash
$ docker-compose up -d
```

### 4-2. MySQL

```bash
$ dokcer-compose exec db mysql -u root -p
password:
```

```sql
/* Switch database */
mysql> USE mysql;
/* Check user and hostname before making a change */
mysql> SELECT user, host FROM user WHERE user = 'root';
/* Allow any host to access to MySQL server */
mysql> UPDATE user SET host = '%' WHERE user = 'root';
/* Check user and hostname after making a change */
mysql> SELECT user, host FROM user WHERE user = 'root';
/* Exit */
mysql> exit;
```

### 4-3. Rails

#### 4-3-1. Create database

```bash
$ docker-compose exec app bin/rails db:create
```

#### 4-3-2. Access `localhost:3000`

![Yay! You're on Ruby on Rails](https://github.com/oasis-forever/rails_experiment/blob/master/public/yay!-you're-on-rails!.png)
