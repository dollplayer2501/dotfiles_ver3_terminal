# My bat's configuration.

I am using [neofusion.bat, Neofusion theme for bat](https://github.com/diegoulloao/neofusion.bat).
For instructions on how to implement this, see [Adding new themes](https://github.com/sharkdp/bat?tab=readme-ov-file#adding-new-themes).
Unlike other configurations, I think this one has a few quirks.

I use the Fish shell, so I have the following settings:

```
abbr --add bat 'command bat --theme="neofusion"'
```

I also use [delta](https://github.com/dandavison/delta).
This application can apply the bat color scheme.
The following settings have been added to `~/.gitconfig`.

```
  :
[delta]
  dark = true
  syntax-theme = neofusion
  :
```
