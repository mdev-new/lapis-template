# image located in lapis-docker/Dockerfile
FROM lapis

RUN mkdir -p /tmp/openresty
RUN mkdir /app
WORKDIR /app

COPY . .

RUN luarocks build
RUN moonc *.moon
RUN cd models && moonc *.moon

ENTRYPOINT lapis serve
