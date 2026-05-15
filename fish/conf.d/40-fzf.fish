#
#
#

#set --export FZF_DEFAULT_OPTS "
#  --height=35%
#  --layout=reverse
#  --border
#  --inline-info
#  --preview 'bat --color=always {}'
#"



#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'

# vitormv.github.io fzf Theme Generator
# https://vitormv.github.io/fzf-themes/

#
# NOTE:
#  - Shift + Up/Down is enabled in right preview pane
#

set --export FZF_DEFAULT_OPTS '
  --height=35%
  --layout=reverse
  --border
  --inline-info
  --preview "bat --theme='neofusion' --style=numbers --color=always {}"
  --bind "shift-down:preview-down,shift-up:preview-up"
  --color=fg:#9999cc,fg+:#ff7f7f
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#ff7f7f
  --color=prompt:#af5fff,spinner:#af5fff,pointer:#ff7f7f,header:#87afaf
  --color=border:#7f3fbf,label:#7f3fbf,query:#ff7f7f
  --border="rounded" --border-label="FZF" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'


fzf --fish | source
