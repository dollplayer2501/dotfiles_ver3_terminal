#
# NOTE:
#   This file is based on `fish_frozen_theme.fish`.
#   This file is generated via the color scheme settings in `fish_config`.
#
#   It seems that if you configure this file to be loaded after `fish_frozen_theme.fish`,
#   these settings will take effect.
#
#   Conversely, configuring a color scheme via `web_config` results in the creation of a `fish_frozen_theme.fish` file.
#   Therefore, to ensure a safe and clean configuration, it is advisable to delete `fish_frozen_theme.fish`.
#

#
# NOTE:
#   "Lava" is configured with its default settings.
#   "Lava" sets `fish_color_*` variables, but does not set `fish_pager_color_*` variables.
#
#   Original file is here.
#     https://github.com/fish-shell/fish-shell/blob/master/share/themes/lava.theme
#
#   Using color
#     #FFC473 #FF9400 #A63100 #FF4C00 #FFDD73 #00a6b2 #FFC000 #BF9C30 #BF5B30
#

set --global fish_color_autosuggestion FFC473
set --global fish_color_cancel --reverse
set --global fish_color_command FF9400
set --global fish_color_comment A63100
set --global fish_color_cwd green
set --global fish_color_cwd_root red
set --global fish_color_end FF4C00
set --global fish_color_error FFDD73
set --global fish_color_escape 00a6b2
set --global fish_color_gray
set --global fish_color_history_current --bold
set --global fish_color_host --reset
set --global fish_color_host_remote yellow
set --global fish_color_keyword
set --global fish_color_normal --reset
set --global fish_color_operator 00a6b2
set --global fish_color_option
set --global fish_color_param FFC000
set --global fish_color_quote BF9C30
set --global fish_color_redirection BF5B30
set --global fish_color_search_match white --bold --background=brblack
set --global fish_color_selection white --bold --background=brblack
set --global fish_color_status red
set --global fish_color_user brgreen
set --global fish_color_valid_path --foreground=ff7f7f --underline # I changed the settings for this line.

#
# NOTE:
#   The following are not configured in Lava.
#   In particular, the following are my own original settings.
#

set --global fish_pager_color_background
set --global fish_pager_color_completion FF4C00
set --global fish_pager_color_description A63100
set --global fish_pager_color_prefix FF9400
set --global fish_pager_color_progress FF4C00
set --global fish_pager_color_secondary_background
set --global fish_pager_color_secondary_completion
set --global fish_pager_color_secondary_description
set --global fish_pager_color_secondary_prefix
set --global fish_pager_color_selected_background --background=221f45
set --global fish_pager_color_selected_completion FF9400
set --global fish_pager_color_selected_description FF9400
set --global fish_pager_color_selected_prefix FF9400


#
# TODO: I suspect this might not be possible.
#   Just leaving this here as a note.
#   I’d like to have the list displayed during auto-completion formatted so that there is exactly one item per line.
#

