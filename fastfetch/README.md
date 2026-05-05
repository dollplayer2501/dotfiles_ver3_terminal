# My Fastfetch's configuration.

There are two types of configuration files:

1. Long format  
`./config..full.jsonc`  
For external presentation.
2. Short format  
`./config..short.jsonc`  
Functions as `fish_greeting`.

To switch between configuration files, run the following abbreviation in the Fish shell.
If no configuration file is specified, `./config..short.jsonc` will be executed.


```fish
abbr --add my_fastfetch_full 'command fastfetch --config ~/.config/fastfetch/config..full.jsonc'
abbr --add my_fastfetch_short 'command fastfetch --config ~/.config/fastfetch/config..short.jsonc'
```
