FROM postgres:latest

# dependency packages for tippecanoe
ENV DEP_PACKAGES build-essential libsqlite3-dev zlib1g-dev

RUN apt-get update && apt-get install -y \
  cmake \
  gdal-bin \
  git \
  p7zip \
  postgis \
  g++

RUN apt-get -y install $DEP_PACKAGES \
  && cd / \
  && git clone https://github.com/mapbox/tippecanoe.git tippecanoe \
  && cd tippecanoe \
  #  && git checkout tags/$TIPPECANOE_RELEASE \
  && cd /tippecanoe \
  && make \
  && make install \
  && cd /

COPY init.sh /docker-entrypoint-initdb.d/10-init.sh

COPY init.mk /nhd
COPY Makefile /nhd
COPY sql /nhd/sql
