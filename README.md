### Hostname config

```sh
sudo scutil --set HostName <hostname>
dscacheutil -flushcache
```

### Git setup

```
git config --global init.templatedir '~/.git_template'
git config --global core.editor /opt/homebrew/bin/nvim
git config --global diff.nodiff.command /usr/bin/true
```

```
# ./.git/info/attributes
package-lock.json  diff=nodiff
```

### Save screenshots as JPEGs and into Downloads

```sh
defaults write com.apple.screencapture location ~/Downloads/
defaults write com.apple.screencapture type jpg
killall SystemUIServer
```
