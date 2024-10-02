if [[ $(hyprctl monitors 2>/dev/null | rg "\sDP-[0-9]+") ]]; then
  if [[ $1 == "open" ]]; then
    hyprctl keyword monitor "eDP-1,preferred,auto,auto"
  else
    hyprctl keyword monitor "eDP-1,disable"
  fi
else
  if [[ $1 != "open" ]]; then
    hyprlock
  fi
fi
