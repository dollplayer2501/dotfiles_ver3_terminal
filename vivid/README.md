# My Vivid's configuration.

I'm using a setting based on the [Vivid Lava theme](https://github.com/sharkdp/vivid/blob/master/themes/lava.yml), with bold and underlined text removed.  
Since I use the Fish shell, I have the following settings in a file stored in [`./fish/conf.d/40-vivid.fish`](./fish/conf.d/40-vivid.fish). I also use the default Lava color theme for the Fish shell.

```fish
set --global --export LS_COLORS (vivid --database ~/.config/vivid/filetypes.yml generate ~/.config/vivid/themes/lava..kaizou.yml)
```

I use [lsd](https://github.com/lsd-rs/lsd), so I've configured my Fish shell abbreviations accordingly.
I only use `la`, so `la` alone is sufficient for me.

```fish
abbr --add la 'command lsd --long --almost-all --classify --versionsort --color=auto --date "+%Y-%m-%d %H:%M"'
```
