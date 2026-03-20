# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
#    # smth smth
end

set -gx EDITOR vim
set -g fish_color_autosuggestion 555555

starship init fish | source
