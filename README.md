## 1. Environment

* WSL(Ubuntu 20.04.1 LTS (GNU/Linux 4.19.128-microsoft-standard x86_64))
* Ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]
* Rails 6.1.3.1
* Docker version 20.10.5, build 55c4c88

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
$ docker-compose exec db mysql -u root -p
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

![Yay! You're on Ruby on Rails](https://github.com/oasis-forever/perfect_ruby_on_rails/blob/master/public/yay!-you're-on-rails!.png)

## 5. Attention in Deployment

### 5-1. `config/credentials.yml.enc`

Do not forget to define a GitHub `client_id` and `client_secret`.

```yaml
# aws:
#   access_key_id: 123
#   secret_access_key: 345
secret_key_base: xxxxxxxxxxxxxxxxxxxxxxxx
github:
  client_id: [your_client_id]
  client_secret: [your_client_secret]
```

### 5-2. Set the Value of Master Key as ENV Variable.

```bash
$ heroku config:set RAILS_MASTER_KEY=`cat config/master.key`
```

## 6. Production on Heroku

[イベント管理アプリ](https://perfect-ruby-on-rails.herokuapp.com/)
