# My Starship's configuration.

<a href="./CachyOS_Qtile_2026-04-07_13-26-01_trim-by-starship.png"><img src="./CachyOS_Qtile_2026-04-07_13-26-01_trim-by-starship.png" width="40%"></a>

Unlike the default settings, the location where the configuration file is stored has been changed. This is configured in the Fish shell.

```
set --global --export STARSHIP_CONFIG /path/to/starship/starship.toml
```


## Regarding the interaction between Starship, Ranger, and Fish Shell

In Ranger, you can start a shell by pressing Shift + s. At this time, you may need to avoid running Ranger twice.  
Therefore, a message like "Ranger is starting" is displayed on the command line. The key is the dynamic manipulation of the variable value of the Fish shell variable `$STARSHIP_SHELL_INDICATOR`.

### `starship.toml`

```
[custom.ranger]
shell = ['fish']
command = "echo $STARSHIP_SHELL_INDICATOR"
when = true
```

### Fish shell

I store the following in `~/.config/fish/conf.d/`. It's a bit strange because it's not a function I usually see.

```
if set -q RANGER_SHELL
  set -x STARSHIP_SHELL_INDICATOR 'RANGER > '
else
  set -x STARSHIP_SHELL_INDICATOR ''
end
```

### `rc.conf` of Ranger

```
map S shell RANGER_SHELL=1 $SHELL
```
