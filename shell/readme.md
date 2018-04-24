# install
- clone `.config` into your `~/.config`
- replace your main shell profile file (something like `~/.zshrc` or `~/.profile`) with the following
```
#~/.profile

main_profile="$HOME/.config/shell/.shell_rc"

if [ -f $main_profile ]
then
  . $main_profile
else
  echo "no shell profile found"
fi

```

# note
- do not put any secrets in any file that is tracked (i.e. inside `.config/`)
- any secrets u wanna store in yr shell profile should be exported in `~/.secrets_rc`)
###### if using `zsh`, depending on yr system, u may need to:
- add either an empty file at `~/.zprofile`
```
# ~/.zprofile
#
# nothing here
#...
```
- or a file that `source`s your `~/.profile`
```
# ~/.zprofile
. $HOME/.profile```
