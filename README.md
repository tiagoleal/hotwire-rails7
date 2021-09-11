<p align="center">
  <a href="#">
   <img alt="Hotwire rails" src="https://github.com/tiagoleal/hotwire-rails7/blob/master/app/assets/images/hotwire.png?raw=true" width="300">
  </a>
</p>

<p align="center">
  <a href="https://github.com/tiagoleal/quickchat">
    <img alt="Current Version" src="https://img.shields.io/badge/version-1.0.0 -blue.svg">
  </a>
  <a href="https://ruby-doc.org/core-2.7.2/">
    <img alt="Ruby Version" src="https://img.shields.io/badge/Ruby-3.0.2 -green.svg" target="_blank">
  </a>
  <a href="https://guides.rubyonrails.org/5_2_release_notes.html">
    <img alt="" src="https://img.shields.io/badge/Rails-~> 7.0.0-blue.svg" target="_blank">
  </a>
  
</p>

Hotwire is an alternative approach to building modern web applications without using much JavaScript by sending HTML instead of JSON over the wire through of WebSocket (which consists of ActionCable, Channels and Streaming Data). [link hotwire](https://hotwired.dev?target=_blank)


## Screenshot



## Stack the Project (TODO: available gems)

- **Ruby On Rails**
- **Redis**
- **SQLite**
- **Rspec(TDD)**
- **Hotwire para Rails**
- **TurboRails**
- **StimulusJS**
- **WebSocket**
- **Action Cable**
- **Coverage**
- **RubyCritic**
- **Attractor**

## Context App

........................

## Benchmark Hotwire x ReactJS

........................

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You must have installed on your machine:

- Docker
- Docker Compose

### Installing

First step is to install the docker service:

```bash
#Linux: ubuntu,Mint
$ sudo apt-get update
$ sudo apt-get install docker-ce
$ sudo apt install docker-compose

# Fedora, centos
$ sudo dnf update -y
$ sudo dnf install docker-ce
$ sudo dnf -y install docker-compose
```

For test if the service was installed with succeed, you can run the command for to check de version of docker:

```bash
$ docker --version
#Must be have the docker version: Docker version 18.06.0-ce
$ docker-compose --version
#Must be have the docker-compose version: docker-compose version 1.22.0
```

## First steps

Follow the instructions to have a project present and able to run it locally.
After copying the repository to your machine, go to the project's root site and:

1.  Construct the container

```
docker-compose build
```

2.  Run the project

```
docker-compose up - d
```

## Running the tests

To run the tests, you must run the docker container through the command:

```
docker-compose run --rm app bundle exec rspec
```

## Running the Ruby Critic.

To Verify the quality report of your Ruby code, you must run the docker container through the command:

```
docker-compose run --rm app bundle exec rubycritic 
```
## Running the Attractor.

To Verify a code complexity metrics visualization and exploration tool, you must run the docker container through the command:

```
docker-compose run --rm app bundle exec attractor report 
```

## Authors

Project created by the following developers
<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars1.githubusercontent.com/u/5727529?s=460&v=4" width="100px;"/><br /><sub><b>Tiago Leal</b></sub>](https://github.com/tiagoleal)<br /> | 
[<img src="https://avatars.githubusercontent.com/u/7293590?v=4" width="100px;"/><br /><sub><b>Jefferson Maran</b></sub>](https://github.com/jeffmaran)<br /> | [<img src="https://avatars.githubusercontent.com/u/1753070?v=4" width="100px;"/><br /><sub><b>Thiago Cardoso</b></sub>](https://github.com/Thiago-Cardoso)<br /> | 
| :---: | :---: | :---: |

