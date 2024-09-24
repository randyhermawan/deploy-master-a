# Deploy Master A

Image to use for CI CD process such as GitHub workflows.

```
docker pull randyhermawan/deploy-master-a:tagname
```

## What installed

Every package installed will be defaulted to latest installation:

- Git
- Serverless Framework CLI @3.39.0
- NPM
- Yarn
- Golang
- OpenTofu (TerraForm)
- AWS CLI

## ENV variable

- GOPRIVATE => Setup for private go module
- AWS_ACCESS_KEY_ID => Serverless framework & deployment to AWS
- AWS_SECRET_ACCESS_KEY => Serverless framework & deployment to AWS

## Go private module setup

To make downloading modules from private repository possible, the following must be configured in CI CD.

```
# GitHub
git config --global url."https://{GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com".insteadOf "https://github.com"
```

## Example usage on GitHub Action

```
jobs:
  build:
    runs-on: ubuntu-latest
    container:
      image: randyhermawan/deploy-master-a:latest
      env:
        GOPRIVATE: github.com/something
```

---

**2022 - 2024 Randy Hermawan**
