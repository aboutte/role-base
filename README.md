[![Build Status](https://api.travis-ci.org/aboutte/role-base.svg?branch=master)](https://travis-ci.org/aboutte/role-base)


# role-base

## Usage

```
source <(curl -s https://raw.githubusercontent.com/aboutte/role-base/master/bootstrap.sh)
```

## Testing


The following command can be used for testing ubuntu16:

```
aws-vault exec p -- bundle exec kitchen verify ubuntu16
```

The following command can be used for testing RHEL 6 and RHEL 7:

```
aws-vault exec p -- bundle exec kitchen verify rhel --concurrency=5
```

The following command can be used for testing locally with Docker:

```
export KITCHEN_LOCAL_YAML=".kitchen.local.yml"; bundle exec kitchen verify all --concurrency=5
```
