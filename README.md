# nginx-with-auth-request

Nginx docker container with ngx_http_auth_request_module installed.

### Development

For local testing, you can build and run the image via

#### Build

**Unix**
```bash
bash scripts/build.sh <nginx-version>
```

Example
```bash
bash scripts/build.sh 1.21.3
```

**Windows**
```cmd
.\scriptsbuild.bat <nginx-version>
```

#### Run

**Unix**
```bash
bash scripts/run.sh
```
**Windows**
```cmd
.\scripts\run.bat
```