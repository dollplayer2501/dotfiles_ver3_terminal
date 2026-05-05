# My Lsd's  configuration.

I realize I'm using the `ls` command in a strange way.  
I usually type `la` and expect the result of `ls -la` to be returned.
I use the Fish shell, so I have the following abbreviations set up.  
I don't use commands like `ls` or `tree`.

```fish
abbr --add la 'command lsd --long --almost-all --classify --versionsort --color=auto --date "+%Y-%m-%d %H:%M"'
```

I manipulate the display colors of the `lsd` command results using `vivid`.

