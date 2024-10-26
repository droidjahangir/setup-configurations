# Node js Installation process

Install nvm to install different version of node
Official documentation : https://github.com/nvm-sh/nvm

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

Install different version `nvm install 12`
Use node version `nvm use 18`

## Install Yarn
```shell
npm install --global yarn
```

