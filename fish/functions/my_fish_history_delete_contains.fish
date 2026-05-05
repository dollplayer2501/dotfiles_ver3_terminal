#
#
#

#
# NOTE:
#  - Check history
#    > builtin history search yay
#

function my_fish_history_delete_contains --description "Delete command history containing a specific word with a certain degree of precision."
  if test (count $argv) -eq 0
    echo (set_color green)"Usage: my_fish_history_delete_contains PATTERN"(set_color normal)
    echo (set_color green)"Check whether the word exists or not using `builtin history search PATTERN`".
    return 1
  end

  set pattern $argv[1]
  set histfile ~/.local/share/fish/fish_history
  set tmpfile (mktemp)

  # Need backup?
  # cp $histfile $histfile.bak

  awk -v pat="$pattern" '
  BEGIN {
    block=""
    keep=1
  }

  /^- cmd: / {
    if (NR>1 && keep) {
      printf "%s", block
    }
    block=$0 "\n"
    keep=($0 !~ pat)
    next
  }

  {
    block = block $0 "\n"
  }

  END {
    if (keep) {
      printf "%s", block
    }
  }
  ' $histfile > $tmpfile

  mv $tmpfile $histfile

  history merge

  echo (set_color green)"Deleted history entries containing: $pattern"(set_color normal)
end
