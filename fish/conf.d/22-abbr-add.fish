#
#
#

# Overwrite warning
abbr --add cp 'command cp --interactive --verbose --preserve=timestamps'
abbr --add mv 'command mv --interactive --verbose' # `mv` does not have `preserve`
abbr --add rm 'command rm --verbose'

#

abbr --add bat 'command bat --theme="neofusion"'
abbr --add delta 'command delta --side-by-side --line-numbers'
abbr --add feh 'command feh --no-fehbg --bg-fill'
abbr --add pict-identify 'command identify -format "%wx%h:%Q"'
abbr --add yay 'yay --sudoloop'

abbr --add cd z # zoxide

abbr --add la 'command lsd --long --almost-all --classify --versionsort --color=auto --date "+%Y-%m-%d %H:%M"'
abbr --add my_fastfetch_full 'command fastfetch --config ~/.config/fastfetch/config..full.jsonc'
abbr --add my_fastfetch_short 'command fastfetch --config ~/.config/fastfetch/config..short.jsonc'
