FROM debian:stretch-slim

LABEL maintainer="Patrick Lange <plange@ets.org>"

RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        build-essential wget git libpcre3-dev zlib1g-dev


ENV NGINX_VERSION 1.13.12
ENV INSTALL_LOCATION /opt/nginx

# Download, untar and symlink
WORKDIR /src
RUN set -x \
    && wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
    && tar -xzf nginx-${NGINX_VERSION}.tar.gz \
    && ln -sf nginx-${NGINX_VERSION} nginx \
    && git clone git://github.com/perusio/nginx-auth-request-module.git

# Build
WORKDIR /src/nginx
RUN set -x \
    && ./configure \
    --user=nginx \
    --group=nginx \
    --prefix=${INSTALL_LOCATION} \
    --with-http_stub_status_module \
    --with-pcre \
    --with-http_realip_module \
    --without-http_scgi_module \
    --without-http_uwsgi_module \
    --without-http_fastcgi_module \
    --with-debug \
    --add-module=/src/nginx-auth-request-module

# Compile and instasll
RUN set -x && make && make install

# Add the user to the system
RUN set -x && useradd -r nginx

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout ${INSTALL_LOCATION}/logs/access.log \
    && ln -sf /dev/stderr ${INSTALL_LOCATION}/logs/error.log

# Start nginx
EXPOSE 80
STOPSIGNAL SIGTERM
WORKDIR ${INSTALL_LOCATION}
CMD ["./sbin/nginx", "-g", "daemon off;"]

