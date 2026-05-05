#
#
#

set --global fish_prompt_pwd_dir_length 0

# TODO:
# GitHub - eth-p/bat-extras: Bash scripts that integrate bat with various command line tools. · GitHub
# https://github.com/eth-p/bat-extras
set --global MANPAGER "sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"

