### My essential VIM plugins

- ack.vim https://github.com/mileszs/ack.vim
- ctrlp.vim https://github.com/kien/ctrlp.vim
- syntastic https://github.com/scrooloose/syntastic
- vim-airline https://github.com/bling/vim-airline
- vim-vinegar https://github.com/tpope/vim-vinegar

Do what described here if the issue with Vinegar and Netrw still exists:
https://github.com/tpope/vim-vinegar/issues/58#issuecomment-156959297


### Git Templates setup

```sh
git config --global init.templatedir '~/.git_template'
```

This prevents an issue with Vim crashing at times when editing a commit message.
```sh
git config --global core.editor /usr/bin/vim
```

