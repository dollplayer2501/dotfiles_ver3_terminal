# My Vivid's configuration.


<a href="./CachyOS_Qtile_2026-04-07_13-51-27_trim-by-vivid.png"><img src="./CachyOS_Qtile_2026-04-07_13-51-27_trim-by-vivid.png" width="40%"></a>


I'm using a setting based on the [Vivid Lava theme](https://github.com/sharkdp/vivid/blob/master/themes/lava.yml), with bold and underlined text removed.  
Since I use the Fish shell, I have the following settings in a file stored in `~/.config/fish/conf.d/`. I also use the default Lava color theme for the Fish shell.

```
set --global --export LS_COLORS (vivid generate /path/to/.config/vivid/themes/lava..kaizou.yml)
```

I primarily use [lsd](https://github.com/lsd-rs/lsd) for the ls command, but I also have [eza](https://github.com/eza-community/eza) available for use. I'm sure I seem quite strange to others.

```
abbr --add la 'command lsd --long --almost-all --classify --versionsort --color=auto --date "+%Y-%m-%d %H:%M"'
abbr --add ls 'command eza -al --color=always --group-directories-first'
```
