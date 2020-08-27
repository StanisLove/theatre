FROM ruby:2.6.3
SHELL ["/bin/bash", "-c"]

ARG PG_MAJOR=10
ARG BUNDLER_VERSION=1.17.2
ARG APP_DIR=/theatre

# Disable apt key warn
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE DontWarn

# Add Postgres to source list
RUN curl -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
      && echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

# Install dependencies
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    apt-utils \
    postgresql-client-$PG_MAJOR \
    locales \
    vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set locale
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
RUN update-locale LANG=C.UTF-8 LC_ALL=C.UTF-8 && \
    echo 'export LANG=C.UTF-8 LC_ALL=C.UTF-8' >>~/.bash_profile


# Configure bundler and PATH
ENV GEM_HOME=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH $APP_DIR/bin:$BUNDLE_BIN:$PATH

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler:$BUNDLER_VERSION

RUN mkdir $APP_DIR
WORKDIR $APP_DIR
COPY . $APP_DIR
