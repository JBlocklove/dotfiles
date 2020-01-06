#!/bin/python3
import os
import subprocess
from os import listdir
from os.path import expanduser, isfile, join

from rofi import Rofi

home = expanduser("~")
user_path = home + "/.config/wal/colorschemes/dark/"
dark_path = "/usr/lib/python3.8/site-packages/pywal/colorschemes/dark/"

user_themes = [t for t in listdir(user_path) if isfile(join(user_path,t))]
dark_themes = [t for t in listdir(dark_path) if isfile(join(dark_path,t))]

theme_list = user_themes + dark_themes

for i in range(len(theme_list)):
    if theme_list[i].endswith('.json'):
        theme_list[i] = theme_list[i][:-5]
theme_list.sort(key=str.lower)

r = Rofi()
theme_index,key = r.select('theme',theme_list)

if key == 0:
    subprocess.run(["wal","-f",theme_list[theme_index]])
    subprocess.run(["spicetify","update"])
