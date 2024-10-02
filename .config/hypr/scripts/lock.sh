#!/bin/bash

action=$1
pw-cli i all | rg running
if [ $? == 1 ]; then
  if [ "$action" == "lock" ]; then
    hyprlock
  elif [ "$action" == "suspend" ]; then
    systemctl suspend
  fi
fi

