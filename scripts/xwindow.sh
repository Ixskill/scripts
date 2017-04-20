#!/usr/bin/bash

get_window_name (){

local window_id
local window_name

window_id=$(xdotool getactivewindow)
[[ -n "$window_id" ]] && window_name=$(xdotool getwindowname $window_id) || window_name="empty workspace"
echo -ne "$window_name"
}

get_window_name
