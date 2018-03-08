### My essential VIM plugins

- https://github.com/mileszs/ack.vim
- https://github.com/kien/ctrlp.vim
- https://github.com/scrooloose/syntastic
- https://github.com/bling/vim-airline
- https://github.com/tpope/vim-vinegar

Plus, maybe:
- https://github.com/mxw/vim-jsx
- https://github.com/editorconfig/editorconfig-vim
- https://github.com/altercation/vim-colors-solarized.git (+ the related iTerm2 color preset)

If the issue with Vinegar and Netrw persists, read the following:
https://github.com/tpope/vim-vinegar/issues/58#issuecomment-156959297


### Git Templates setup

```sh
git config --global init.templatedir '~/.git_template'
```

This prevents an issue with Vim crashing at times, when editing a commit message.
```sh
git config --global core.editor /usr/bin/vim
```
