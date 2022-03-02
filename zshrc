export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# https://github.com/sindresorhus/pure
fpath+=('/Users/marco/.nvm/versions/node/v14.19.0/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
prompt pure
