<p align="center">
  <a href="#">
   <img alt="Hotwire rails" src="https://github.com/tiagoleal/hotwire-rails7/blob/master/app/assets/images/hotwire.png?raw=true" width="300">
  </a>
</p>
<p align="center">Market List</p>

<p align="center">
  <a href="https://github.com/tiagoleal/hotwire-rails7">
    <img alt="Current Version" src="https://img.shields.io/badge/version-1.0.0 -blue.svg">
  </a>
  <a href="https://ruby-doc.org/core-2.7.2/">
    <img alt="Ruby Version" src="https://img.shields.io/badge/Ruby-3.0.2 -green.svg" target="_blank">
  </a>
  <a href="https://guides.rubyonrails.org/5_2_release_notes.html">
    <img alt="" src="https://img.shields.io/badge/Rails-~> 7.0.0-blue.svg" target="_blank">
  </a>
</p>

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Web

<a href="https://market-list-hotwire.herokuapp.com" target="_blank">Acessar projeto</a>

## Modelagem BD

<a href="https://github.com/tiagoleal/hotwire-rails7/blob/master/app/assets/images/database.png" target="_blank">Acessar Link</a>

## Screenshot
![](https://github.com/tiagoleal/hotwire-rails7/blob/master/app/assets/images/hotwire.gif)

## Market List
Development of a market list using Ruby on Rails 7, Ruby 3, hotwire and Stimulus Js
- Manage your products

## Stack the Project

- **Ruby On Rails**
- **Redis**
- **PostgreSql**
- **Rspec(TDD)**
- **Hotwire para Rails**
- **TurboRails**
- **StimulusJS**
- **WebSocket**
- **Action Cable**

### Populate data of access
Run seed

## Index

- [Requirements](#requirements)
- [First steps](#first-steps)
- [Authors](#authors)
- [Tests](#tests)
- [License](#license)

### Requirements

First step is to install the docker service:

```bash
#Linux: ubuntu,Mint
$ sudo apt-get update
$ sudo apt-get install docker-ce
$ sudo apt install docker-compose

# Fedora
$ sudo dnf update -y
$ sudo dnf install docker-ce
$ sudo dnf -y install docker-compose
```

## Tests

For test if the service was installed with succeed, you can run the command for to check de version of docker:

```bash
$ docker --version
#Must be have the docker version: Docker version 18.06.0-ce
$ docker-compose --version
#Must


You must have installed on your machine:

- Docker
- Docker Compose
```

## First steps
```

Follow the instructions to have a project present and able to run it locally.

After copying the repository to your machine, go to the project's root site and:


1.  Construct the container

```
docker-compose build
```

2.  Create of Database

```
docker-compose run --rm website bundle exec rails db:create db:migrate

```

3.  up the project

```
docker-compose up
```

4. Without turning off the server, open a new window and run the migrations

```
docker-compose run --rm website bundle exec rails db:migrate if necessary populate database

OBS. If the server does not create the pid file. due to gitignore
it is necessary to create manually.
mkdir tmp/pids

**Model**

Category
docker-compose run --rm website bundle exec rspec spec/models/category_spec.rb

Product
docker-compose run --rm website bundle exec rspec spec/models/product_spec.rb

Order
docker-compose run --rm website bundle exec rspec spec/models/order_spec.rb

OrderProduct
docker-compose run --rm website bundle exec rspec spec/models/order_product_spec.rb

User
docker-compose run --rm website bundle exec rspec spec/models/user_spec.rb

## Authors

Project created by the following developers

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars.githubusercontent.com/u/1753070?v=4" width="100px;"/><br /><sub><b>Thiago Cardoso</b></sub>](https://github.com/Thiago-Cardoso)<br /> | [<img src="https://avatars1.githubusercontent.com/u/5727529?s=460&v=4" width="100px;"/><br /><sub><b>Tiago Leal</b></sub>](https://github.com/tiagoleal)<br /> | [<img src="https://avatars.githubusercontent.com/u/7293590?v=4" width="100px;"/><br /><sub><b>Jefferson Maran</b></sub>](https://github.com/jeffmaran)<br /> |
| :---: | :---: | :---: |

## License

This project is licensed under a Apache license 2.0 - see file [LICENSE](LICENSE) for more details