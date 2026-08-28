if status is-interactive
# Commands to run in interactive sessions can go here

  # NOTE:
  # Since I'm using `patrickf1/fzf.fish`, do I need to configure it here?
  # Does the default `Ctrl-Alt-P` conflict with some other keybinding?

  fzf_configure_bindings \
    --directory=ctrl-alt-d \
    --processes=ctrl-alt-x

end
