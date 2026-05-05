#
# NOTE:
# - See https://github.com/sharkdp/vivid/tree/master#theme-preview Theme preview, sharkdp/vivid
# - Running this script will rewrite $LS_COLORS.
#

function my_vivid_themes -d ""
  for theme in (vivid themes)
    echo "Theme: $theme"

    # NOTE:
    # 1. download https://github.com/sharkdp/vivid/blob/master/config/filetypes.yml
    # 2. rename `filetypes.yml`` to `filetypes..ORIGINAL.yml`

    set LS_COLORS (vivid --database ~/.config/vivid/filetypes..ORIGINAL.yml generate $theme)

    command lsd --long --almost-all --classify --versionsort --color=auto --date "+%Y-%m-%d %H:%M"
    echo
  end
end
