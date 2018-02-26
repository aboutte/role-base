# role-bsae


The following command can be used for testing ubuntu16:

```
export AWS_PROFILE="p"; kitchen verify ubuntu16
```

The following command can be used for testing RHEL 6 and RHEL 7:

```
export AWS_PROFILE="p"; kitchen verify rhel --concurrency=5


- add freipa
- install and setup ntp
- set time zone



source <(curl -s https://raw.githubusercontent.com/aboutte/role-base/master/bootstrap.sh)