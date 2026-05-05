#
#
#

function my_color_code --description "Display color code."

  for ii in (seq 0 15)
    for jj in (seq 0 15)
      set --local code (math "$ii * 16 + $jj")
      printf "\e[38;5;%sm %+4s" $code $code
    end
    echo -e "\e[0m"
  end
end
