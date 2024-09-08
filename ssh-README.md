### Generate ssh key

`ssh-keygen -t rsa -b 2048 -C 'Keys generated on september 2024`

This will generate ssh private and public key to this directory `.ssh/`

This public key should upload to any site which should authenticate

#### upload ssh public key to digital ocean
```shell
ssh-copy-id root@192.168.1.1
```

we can disable password authentication in server setting `/etc/ssh/sshd_config`




