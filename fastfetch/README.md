# My Fastfetch's configuration.

<a href="./CachyOS_Qtile_2026-04-07_14-51-44_trim-by-fastfetch.png"><img src="./CachyOS_Qtile_2026-04-07_14-51-44_trim-by-fastfetch.png" width="40%"></a>

I have separate settings for the long and short greetings.
The short greeting is the string displayed when the terminal starts.
I'm using this unusual setting because I don't want to break the Fish shell settings, `fish_greeting`, that were configured by the distribution.
Therefore, when I run fastfetch normally, I issue the following command.

```
abbr --add my_fastfetch 'command fastfetch --config ~/.config/fastfetch/config..long.jsonc'
```


<!--
MOTE: This is full configuration
fastfetch --gen-config-full
-->

