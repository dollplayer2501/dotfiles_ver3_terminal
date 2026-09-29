#
#
#

function my_atomicparsley_get_many_detail --description ""

  set --local target_extension "M4A|MP3"

  #
  # Argument processing
  #

  if test (count $argv) -ne 1
    echo "Usage: my_atomicparsley_get_many_detail <directory>" >&2
    return 1
  end

  if not test -d $argv[1]
    echo "Error: '$argv[1]' is not a directory." >&2
    return 1
  end

  set --local music_path (realpath $argv[1])

  #
  #
  #

  for file in $music_path/*
    if not string match -qri "\.($target_extension)\$" -- $file
      continue
    end

    set --local file_basename (basename "$file")
    echo (set_color green -o)$file_basename(set_color normal)

    set --local metadata (
      command ffprobe -v error \
        -select_streams v \
        -show_entries format_tags=title,artist,album,date,track \
        -show_entries stream=codec_type:stream_disposition=attached_pic \
        -of default=noprint_wrappers=1 \
        "$file"
    )

    set --local title  (string replace 'TAG:title=' ''  (string match 'TAG:title=*'  $metadata))
    set --local artist (string replace 'TAG:artist=' '' (string match 'TAG:artist=*' $metadata))
    set --local album  (string replace 'TAG:album=' ''  (string match 'TAG:album=*'  $metadata))
    set --local date   (string replace 'TAG:date=' ''   (string match 'TAG:date=*'   $metadata))
    set --local track  (string replace 'TAG:track=' ''  (string match 'TAG:track=*'  $metadata))

    set --local cover (string replace 'DISPOSITION:attached_pic=' '' (string match 'DISPOSITION:attached_pic=*' $metadata))

    #
    #
    #


    set --local line1
    set --local line2
    set --local line3

    #

    if not test -z "$artist"
      set line1 (string join '' $line1 (set_color yellow -d)"  Artist: "(set_color normal)(set_color yellow)$artist(set_color normal))
    end

    if not test -z "$date"
      set --local tmp (string join ' | ' $date)
      set line1 (string join '' $line1 (set_color yellow -d)"  Date: "(set_color normal)(set_color yellow)$tmp(set_color normal))
    end

    #

    if not test -z "$album"
      set line2 (string join '' $line2 (set_color yellow -d)"  Album: "(set_color normal)(set_color yellow)$album(set_color normal))
    end

    if not test -z "$track"
      set line2 (string join '' $line2 (set_color yellow -d)"  Track: "(set_color normal)(set_color yellow)$track(set_color normal))
    end

    if not test -z "$cover"
      set line2 (string join '' $line2 (set_color yellow -d)"  Cover: "(set_color normal)(set_color yellow)Images included(set_color normal))
    end

    #

    if not test -z "$title"
      set line3 (string join '' $line3 (set_color yellow -d)"  Title: "(set_color normal)(set_color yellow)$title(set_color normal))
    end

    #

    if not test -z "$line1"
      echo $line1
    end
    if not test -z "$line2"
      echo $line2
    end
    if not test -z "$line3"
      echo $line3
    end



#    if not test -z "$artist"
#      echo (set_color yellow -d)"  Artist: " (set_color normal)(set_color yellow)$artist(set_color normal)
#    end
#    if not test -z "$album"
#      echo (set_color yellow)"  Album:  " $album(set_color normal)
#    end
#    if not test -z "$title"
#      echo (set_color yellow)"  Title:  " $title(set_color normal)
#    end
#    if not test -z "$date"
#      set --local tmp (string join ' | ' $date)
#      echo (set_color yellow)"  Date:   " $tmp(set_color normal)
#    end
#    if not test -z "$track"
#      echo (set_color yellow)"  Track:  " $track(set_color normal)
#    end
#    if not test -z "$cover"
#      echo (set_color yellow)"  Cover:   Images included"(set_color normal)
#    end

  end
end
