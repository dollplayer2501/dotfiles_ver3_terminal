#
#
#

function my_atomicparsley_set_many_jacket --description "Set the album art for the music files in the folder."

  set --local target_extension "M4A|MP3"

  #
  # Argument processing
  #

  if test (count $argv) -ne 2
    echo "Usage: my_atomicparsley_jacket <directory> <image file>" >&2
    return 1
  end

  if not test -d $argv[1]
    echo "Error: '$argv[1]' is not a directory." >&2
    return 1
  end

  if not test -f $argv[2]
    echo "Error: '$argv[2]' is not a file." >&2
    return 1
  end

  set --local music_path (realpath $argv[1])
  set --local image_file (realpath $argv[2])

  #
  #
  #

  for file in $music_path/*
    if not string match -qri "\.($target_extension)\$" -- $file
      continue
    end

    #
    # if mp3, convert m4a
    #

    set --local target_file
    if string match -qi "*.MP3" $file
      set target_file (string replace -ri '\.mp3$' '.m4a' $file)
      ffmpeg -i "$file" \
        -map_metadata 0 -c:a aac -q:a 2 -movflags +faststart \
        -loglevel error -y \
        "$target_file"
    else
      set target_file $file
    end

    #
    # Run AtomicParsley.
    #

    command atomicparsley "$target_file" \
      --artwork REMOVE_ALL \
      --artwork "$image_file" \
      --overWrite
  end
end
