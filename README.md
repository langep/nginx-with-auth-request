# nginx-with-auth-request

Nginx docker container with ngx_http_auth_request_module installed.

### Development

#### Release a new version

A new image can be released via tagging with the nginx version. For example,
to build the image for version `1.21.3`, do the following 

```bash
git tag v1.21.3
git push origin v1.21.3
```

#### Build

For local testing, you can build the image like this:

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

For local testing, you can run the image like this:

**Unix**
```bash
bash scripts/run.sh
```
**Windows**
```cmd
.\scripts\run.bat
```