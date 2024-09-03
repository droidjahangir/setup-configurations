## Create a vagrant file to create a new virtual machine

```shell
vagrant init
```

### Create configuration for nginx

```shell
Vagrant.configure("2") do |config|

  # Define the VM
  config.vm.define "vm_nginx" do |vm_nginx|
    vm_nginx.vm.box = "generic/ubuntu2204"
    vm_nginx.vm.hostname = "vm1"
    vm_nginx.vm.network "private_network", ip: "192.168.56.101"
    vm_nginx.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end

    # Provisioning script
    vm_nginx.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y nginx

      # Start NGINX service
      sudo systemctl start nginx

      # Enable NGINX to start on boot
      sudo systemctl enable nginx
    SHELL

    # Port forwarding configuration
    vm_nginx.vm.network "forwarded_port", guest: 80, host: 8080
  end

end
```

### Create vm using vagrantfile
```shell
vagrant up
```

#### ssh to this virtual machine . There's no need to password because vagrant default uses as passkey 
```shell
vagrant ssh vm_nginx
```

then forwarded port `8080` will run nginx

Get nginx master and worker process list using this command `ps aux | grep nginx`

Get configuration files `ls -l /etc/nginx`

Necessary packages `apt install libpcre3 libpcre3-dev zlib1g-dev libssl-dev`

### Default configuration file to edit 
`/etc/nginx/nginx.conf`

```shell
events {}

http {
  include mime.types;

  server {
    listen 80;
    server_name 192.168.56.101;
   
    root /sites/demo/simple-spa-demo;

    location = /greet {
      return 200 'Hello from NGINX "/greet" location - EXACT MATCH';
    }
  }
}
```

install nodejs 

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install 20
```

check Nginx syntax `nginx -t`





