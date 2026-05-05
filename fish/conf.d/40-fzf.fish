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
set --export FZF_DEFAULT_OPTS '
  --height=35%
  --layout=reverse
  --border
  --inline-info
  --preview "bat --color=always {}"
  --color=fg:#d0d0d0,fg+:#d0d0d0
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#7f3fbf,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="FZF" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'


fzf --fish | source
