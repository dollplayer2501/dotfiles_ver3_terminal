#
# 12 Duotone Gradient Inspiration for Graphic Design - Zeka Design
#  https://www.zekagraphic.com/12-duotone-gradient-inspiration/
# Duotone by ShapeFactory | Create Beautiful Free Duotones
#  https://duotone.shapefactory.co/
#
# Duotone Images With ImageMagick In Wordpress | Clixel Blog
#  https://blog.clixel.com/posts/duotone-images-with-imagemagick-in-wordpress/
#
function my_magick_duotone_one --description "Convert image to one duotone."

  if test (count $argv) -eq 0
    echo "Error: Need argument, input file name"
    return 1
  end

  set --local filename_full $argv[1]
  set --local file_basename  (basename $filename_full)
  set --local file_name      (string split -r -m1 . $file_basename)[1]
  set --local file_extension (string split -r -m1 . $filename_full)[2]

  set --local color_1_0 $argv[2]
  set --local color_2_0 $argv[3]

  if test -z "$argv[2]"
    set color_1_0 "#08052b"
  end
  if test -z "$argv[3]"
    set color_2_0 "#ff7f7f"
  end

  set --local color_1_1 (string sub --start 2 $color_1_0)
  set --local color_2_1 (string sub --start 2 $color_2_0)

  set --local filename_output (printf "%s__duotone_%s_%s.%s" $file_name $color_1_1 $color_2_1 $file_extension)

  # set fish_trace 1
  command magick $filename_full -colorspace gray -level +10% +level-colors "$color_1_0","$color_2_0" $filename_output
  # set fish_trace 0
end
