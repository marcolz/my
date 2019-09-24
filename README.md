### VIM plugins

- https://github.com/altercation/vim-colors-solarized
- https://github.com/bling/vim-airline
- https://github.com/kien/ctrlp.vim
- https://github.com/mileszs/ack.vim
- https://github.com/MaxMEllon/vim-jsx-pretty
- https://github.com/pangloss/vim-javascript
- https://github.com/scrooloose/nerdtree
- https://github.com/tpope/vim-pathogen
- https://github.com/tpope/vim-surround
- https://github.com/vim-airline/vim-airline-themes
- https://github.com/dense-analysis/ale

This prevents an issue with Vim crashing at times, when editing a commit message.
```sh
git config --global core.editor /usr/bin/vim
```

### Set the hostname

```sh
sudo scutil --set HostName <hostname>
dscacheutil -flushcache
```

### iTerm2 theme

- https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized


### Git Templates setup

```sh
git config --global init.templatedir '~/.git_template'
```

```
$ git config diff.nodiff.command /usr/bin/true
$ cat ./.git/info/attributes
package-lock.json  diff=nodiff
```

### Save screenshots into Downloads

```sh
defaults write com.apple.screencapture location ~/Downloads/
defaults write com.apple.screencapture type jpg
killall SystemUIServer
```
