#
#
#

function my_atomicparsley_set_one_detail --description "Set the artist name, song title, album title, and track number for a song."

  #
  #
  #

  set --local target_extension "M4A|MP3"

  set --local filename
  set --local artist
  set --local title
  set --local album
  set --local tracknum
  set --local show_help 0

  #
  # Argument processing
  #

  if test (count $argv) -eq 0
    set show_help 1
  end

  while test (count $argv) -gt 0
    switch $argv[1]

      case -i --input
        set filename $argv[2]
        set argv $argv[3..-1]

      case --artist
        set artist $argv[2]
        set argv $argv[3..-1]

      case --title
        set title $argv[2]
        set argv $argv[3..-1]

      case --album
        set album $argv[2]
        set argv $argv[3..-1]

      case --tracknum
        set tracknum $argv[2]
        set argv $argv[3..-1]

      case -h --help
        set show_help 1
        break

      case '*'
        echo "Unknown option: $argv[1]"
        set show_help 1
        break
    end # switch
  end # while

  #
  # Help!
  #

  if test $show_help -eq 1
    echo -n (set_color green)
    echo "Usage: my_atomicparsley_one "(set_color --bold)"-i/--input"(set_color green --reset)" [M4A/MP3 FILE] [OPTIONS]"
    echo "  --artist   (string)"
    echo "  --title    (string)"
    echo "  --album    (string)"
    echo "  --tracknum (number)[/tot]"
    echo "  --help, -h"
    echo "Note:"
    echo "  - The input file will be overwritten."
    echo "  - For items that are not configured, no action is taken, and the state prior to modification is retained."
    echo "  - If an MP3 file is specified as the input file, it is converted to an M4A file using ffmpeg."
    echo "  - The individual settings are not reset to their default values."
    echo -n (set_color normal)

    return 1
  end

  #
  # Display of configuration items and settings
  #

  echo -n (set_color green)
  echo "filename:" $filename
  echo "artist:  " $artist
  echo "title:   " $title
  echo "album:   " $album
  echo "tracknum:" $tracknum
  echo -n (set_color normal)

  #
  # Pause and wait for key input.
  #

  read -P (set_color yellow)"Continue to process (y/N): "(set_color normal) -l confirm
  switch $confirm
    case Y y
      echo (set_color green)"Continue..."(set_color normal)
    case '*'
      echo (set_color green)"Cancel"(set_color normal)
      return 1
  end

  #
  #
  #

  set --local atomicparsley_file
  if string match -qi "*.MP3" $filename
    set atomicparsley_file (string replace -ri '\.MP3$' '.m4a' (realpath $filename))
  else
    set atomicparsley_file (realpath $filename)
  end

  set --local atomicparsley_args $atomicparsley_file
  if test -n "$artist"
    set --append atomicparsley_args --artist $artist
  end
  if test -n "$title"
    set --append atomicparsley_args --title $title
  end
  if test -n "$album"
    set --append atomicparsley_args --album $album
  end
  if test -n "$tracknum"
    set --append atomicparsley_args --tracknum $tracknum
  end
  set --append atomicparsley_args --overWrite
  echo $atomicparsley_args

  #
  # if mp3, convert m4a
  #

  if string match -qi "*.MP3" $filename
    set --local ffmpeg_finename (realpath $filename)

    command ffmpeg -i "$ffmpeg_finename" \
      -map_metadata 0 -c:a aac -q:a 2 -movflags +faststart \
      -loglevel error -y \
      "$atomicparsley_file"
  end

  #
  # Run AtomicParsley.
  #

  command atomicparsley $atomicparsley_args
end
