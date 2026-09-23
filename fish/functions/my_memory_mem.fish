#
#
#

function my_memory_mem --description "free -h to display mem data"

  if test (count $argv) -eq 0; or test "$argv[1]" = "-s"; or test "$argv[1]" = "--short"
    #
    # Argument: nothing or -s or --short
    #
    command free -h | awk '/^Mem:/ {
      printf "Total: %s - Used: %s Free: %s Available: %s\n",
        $2, $3, $4, $7 }'

  else if test "$argv[1]" = "-l"; or test "$argv[1]" = "--long"
    #
    # Argument: -l or --long
    #
    command free -h | awk '/^Mem:/ {
      printf "Total: %s - Used: %s Free: %s Shared: %s Buff/Cache: %s Available: %s\n",
        $2, $3, $4, $5, $6, $7 }'

  else
    #
    # Argument: other than the above
    #
    echo (set_color yellow)"Usage: my_memory_mem [-s|--short] [-l|--long]"(set_color normal) >&2

  end
end
