#
#
#

function my_extract --description "Extract major compressed files"

  if test (count $argv) -eq 0
    echo (set_color green)"Extract major compressed file"(set_color normal)
    return 0
  else if test (count $argv) -ne 1
    echo (set_color red)"Input archive one file"(set_color normal)
    return 1
  end

  set --local f $argv[1]

  if not test -f $f
    echo (set_color red)"File does not exist: $f"(set_color normal)
    return 1
  end

  switch $f
    case '*.tar.gz' '*.tgz'
      command tar xzf $f
    case '*.tar.bz2' '*.tbz2'
      command tar xjf $f
    case '*.tar.xz' '*.txz'
      command tar xJf $f
    case '*.tar.zst'
      command tar --use-compress-program=unzstd -xf $f
    case '*.tar'
      command tar xf $f
    case '*.gz'
      command gunzip $f
    case '*.bz2'
      command bunzip2 $f
    case '*.xz'
      command unxz $f
    case '*.zst'
      command unzstd $f
    case '*.zip'
      command unzip $f
    case '*.7z'
      command 7z x $f
    case '*.rar'
      command unrar x $f
    case '*.Z'
      command uncompress $f
    case '*'
      echo (set_color red)"This file extension is not supported as the file does not exist: $f"(set_color normal)
  end

  if test $status -eq 0
    echo (set_color green)"Done: $f"(set_color normal)
  else
    echo (set_color red)"Failure: $f"(set_color normal)
  end
end
