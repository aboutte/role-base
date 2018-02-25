# role-bsae


By commenting out different blocks it is easy to test the cookbook against each environment.  

The following command can be used for testing Windows 2008 in REAN Trainee account

```
export AWS_PROFILE="rt"; kitchen verify windows2008
```

The following command can be used for testing RHEL 6 and RHEL 7 in REAN GovCloud:

```
export AWS_PROFILE="rgc"; kitchen verify rhel --concurrency=5


- add users
- add my standard packages
- install and setup ntp
- support following OSes
-- centos 5,6,7
-- ubuntu 12, 14 16



source <(curl -s https://raw.githubusercontent.com/aboutte/role-base/master/bootstrap.sh)