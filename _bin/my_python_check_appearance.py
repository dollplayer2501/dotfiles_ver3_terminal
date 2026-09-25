#! /usr/bin/env python3

#
# A script with no public significance—something I might use for purely personal purposes.
# I use three methods to change themes, cursors, and icon sets.
#   1. Changes made via the Xfce4 settings dialog (Appearance)
#   2. Directly edit the dotfile (INI file) for Gtk3/Gtk4.
#   3. The cursors is also set to ~/.Xresources and ~/.xprofile
# However, I do not fully grasp what is correct or where the effects of these settings will extend.
#

import configparser
import os
import re
import pprint
import sys
import xml.etree.ElementTree as ET


#
#
#
def get_ini(_file: str) -> dict:
  config = configparser.ConfigParser()
  config.read(os.path.expanduser(_file), encoding = 'utf-8')
  return {
    'font-name': config['Settings']['gtk-font-name'],
    'theme-name': config['Settings']['gtk-theme-name'],
    'icon-theme-name': config['Settings']['gtk-icon-theme-name'],
    'cursor-theme-name': config['Settings']['gtk-cursor-theme-name'],
    'cursor-theme-size': config['Settings']['gtk-cursor-theme-size'],
  }


#
#
#
def get_xml(_file: str) -> dict:
  #
  def finding(_key: str) -> str:
    element = root.find(_key)
    if element is not None:
      return element.get('value')
    else:
      return None

  tree = ET.parse(os.path.expanduser(_file))
  root = tree.getroot()

  return {
    'font-name': finding(".//property[@name='FontName']"),
    'theme-name': finding(".//property[@name='ThemeName']"),
    'icon-theme-name': finding(".//property[@name='IconThemeName']"),
    'cursor-theme-name': finding(".//property[@name='CursorThemeName']"),
    'cursor-theme-size': finding(".//property[@name='CursorThemeSize']"),
  }


#
#
#
def get_xresources(_file: str) -> dict:
  #
  def finding(_lines: list, _match: str) -> str:
    for line in _lines:
      line = line.rstrip()
      match = re.search(_match, line)
      if match:
        return match.group(1)

  name = size = None
  with open(os.path.expanduser(_file), 'r', encoding = 'utf-8') as ff:
    lines = ff.readlines()

    name = finding(lines, r'Xcursor\.theme:\s*([^\s\n]+)')
    size = finding(lines, r'Xcursor\.size:\s*([^\s\n]+)')

  return {
    'cursor-theme-name': name,
    'cursor-theme-size': size,
  }


#
#
#
def get_xprofile(_file: str) -> dict:
  #
  def finding(_lines: list, _match: str) -> str:
    for line in _lines:
      line = line.rstrip()
      match = re.search(_match, line)
      if match:
        return match.group(1)

  name = size = None
  with open(os.path.expanduser(_file), 'r', encoding = 'utf-8') as ff:
    lines = ff.readlines()

    name = finding(lines, r'export *XCURSOR_THEME=\s*([^\s\n]+)')
    size = finding(lines, r'export *XCURSOR_SIZE=\s*([^\s\n]+)')

  return {
    'cursor-theme-name': name,
    'cursor-theme-size': size,
  }


#
#
#
if __name__ == "__main__":

  #
  #
  #

  hoge = {}

  hoge['Gtk3'] = get_ini('~/.config/gtk-3.0/settings.ini')
  hoge['Gtk4'] = get_ini('~/.config/gtk-4.0/settings.ini')
  hoge['Xfce4'] = get_xml('~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml')

  hoge['.Xresources'] = get_xresources('~/.Xresources')
  hoge['.xprofile'] = get_xprofile('~/.xprofile')

  # pprint.pprint(hoge)


  #
  #
  #

  fixed_string_pattern = '%-20s %-25s %-25s %-25s %-25s %-25s'

  print(fixed_string_pattern % ('', 'Gtk3', 'Gtk4', 'Xfce4', '.Xresources', '.xprofile'))
  print('-' * (20 + (25 * 5)))

  print(fixed_string_pattern % ('Font name',
    hoge['Gtk3']['font-name'],
    hoge['Gtk4']['font-name'],
    hoge['Xfce4']['font-name'],
    '', '',
  ))

  print(fixed_string_pattern % ('Theme name',
    hoge['Gtk3']['theme-name'],
    hoge['Gtk4']['theme-name'],
    hoge['Xfce4']['theme-name'],
    '', '',
  ))

  print(fixed_string_pattern % ('Icon theme name',
    hoge['Gtk3']['icon-theme-name'],
    hoge['Gtk4']['icon-theme-name'],
    hoge['Xfce4']['icon-theme-name'],
    '', '',
  ))

  print(fixed_string_pattern % ('Cursor theme name',
    hoge['Gtk3']['cursor-theme-name'],
    hoge['Gtk4']['cursor-theme-name'],
    hoge['Xfce4']['cursor-theme-name'],
    hoge['.Xresources']['cursor-theme-name'],
    hoge['.xprofile']['cursor-theme-name'],
  ))
  print(fixed_string_pattern % ('Cursor theme size',
    hoge['Gtk3']['cursor-theme-size'],
    hoge['Gtk4']['cursor-theme-size'],
    hoge['Xfce4']['cursor-theme-size'],
    hoge['.Xresources']['cursor-theme-size'],
    hoge['.xprofile']['cursor-theme-size'],
  ))


  sys.exit()

