#!/bin/bash

menu() {
  local prompt="$1"
  local options="$2"
  local extra="$3"
  local preselect="$4"

  read -r -a args <<<"$extra"

  if [[ -n "$preselect" ]]; then
    local index
    index=$(echo -e "$options" | grep -nxF "$preselect" | cut -d: -f1)
    if [[ -n "$index" ]]; then
      args+=("-a" "$index")
    fi
  fi

  echo -e "$options" | walker --dmenu --theme dmenu_200 -p "$prompt…" "${args[@]}"
}

show_power_menu() {
  case $(menu "System" "󰤄  Suspend\n󰜉  Restart\n󰐥  Shutdown") in
  *Suspend*) systemctl suspend ;;
  *Restart*) systemctl reboot ;;
  *Shutdown*) systemctl poweroff ;;
  *) show_main_menu ;;
  esac
}

show_power_menu

