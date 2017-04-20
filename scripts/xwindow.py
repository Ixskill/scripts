#!/usr/bin/env python3

import i3ipc
import sys
import subprocess

i3 = i3ipc.Connection()

out = subprocess.run(["ls", "-l"], stdout=subprocess.PIPE)
def on_window_focus(i3, e):
    focused = i3.get_tree().find_focused()
    if focused.name == "termite":
        print ( u'\uf08e' + " Termite")
    elif focused.name.find("Slack") != -1:
        print ( u'\ue80a' + (focused.name))
    elif focused.name.find("VIM") != -1:
        print (u'\ue809' + "VIM - " + focused.name.split("(")[0])
    elif focused.name.find("Firefox") != -1:
            print(u'\ue801' + "Mozilla Firefox - " + focused.name.split('-')[-2])
    else:
        if len(focused.name) > 40:
            print(focused.name.split('-')[-1] + " -" + focused.name.split('-')[-2])
        else:
            print(focused.name)
    sys.stdout.flush()

on_window_focus(i3, None)

i3.on('window::focus', on_window_focus)

i3.main()
