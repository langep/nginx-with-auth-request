set build_nginx_version=1.13.12
set cli_build_nginx_version=%1

if defined cli_build_nginx_version (
    set build_nginx_version=%cli_build_nginx_version%
)

docker.exe build --build-arg BUILD_NGINX_VERSION=%build_nginx_version% -t langep/nginx-with-auth-request:latest .