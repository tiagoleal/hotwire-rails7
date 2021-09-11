FROM ruby:3.0.2

## ----------------------------------------------------
## TimeZone
## ----------------------------------------------------
RUN echo "export TZ=America/Sao_Paulo" >> /etc/profile
RUN echo "America/Sao_Paulo" > /etc/timezone
RUN ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

## ----------------------------------------------------
## Nodejs e yarn
## ----------------------------------------------------
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
build-essential curl libpq-dev imagemagick git-all \
git-core zlib1g-dev build-essential libssl-dev libreadline-dev \ 
libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev \
libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# set path
ENV INSTALL_PATH /tweetshotwire
# create directory
RUN mkdir -p $INSTALL_PATH
# set path with principal directory
WORKDIR $INSTALL_PATH
# copy gemfile inside container
COPY Gemfile ./
# set path for gems
ENV BUNDLE_PATH /app-gems
COPY . .
