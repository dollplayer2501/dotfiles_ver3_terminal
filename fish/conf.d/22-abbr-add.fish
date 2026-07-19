#
#
#

# Overwrite warning
abbr --add cp 'command cp --interactive --verbose --preserve=timestamps'
abbr --add mv 'command mv --interactive --verbose' # `mv` does not have `preserve`
abbr --add rm 'command rm --verbose'


#

abbr --add la 'command lsd --long --almost-all --classify --versionsort --color=auto --date "+%Y-%m-%d %H:%M"'

#

abbr --add bat 'command bat --theme="neofusion"'
abbr --add delta 'command delta --side-by-side --line-numbers'
abbr --add feh 'command feh --no-fehbg --bg-fill'
abbr --add yay 'yay --sudoloop'


#

abbr --add my_update_pkg_non_aur 'sudo pacman -Syu'
abbr --add my_update_pkg_aur 'yay -Sua --aur --editmenu'

abbr --add my_fastfetch_full 'command fastfetch --config ~/.config/fastfetch/config..full.jsonc'
abbr --add my_fastfetch_short 'command fastfetch --config ~/.config/fastfetch/config..short.jsonc'

abbr --add my_endeavouros_birth "command head -n1 /var/log/pacman.log | cut -d'T' -f1 | tr -d '['"
abbr --add my_magick_identify 'command identify -format "%wx%h:%Q"'


#

# NOTE:
# The decision on whether to completely replace cd with zinc oxide is still pending.
# abbr --add 'command cd z'

# NOTE:
# Assuming the zoxide configuration for the fish shell is active.
abbr --add zz 'z ../'

# NOTE:
# What I need for Picom settings and the like is the value of the second argument of `WM_CLASS(STRING)`.
abbr --add my_xprop 'command xprop | grep WM_CLASS'

