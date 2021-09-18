#!/usr/bin/env sh
DEFAULT_BUILD_NGINX_VERSION=1.13.12
BUILD_NGINX_VERSION=${1:-$DEFAULT_BUILD_NGINX_VERSION}

docker build --build-arg BUILD_NGINX_VERSION=$BUILD_NGINX_VERSION -t langep/nginx-with-auth-request:latest .