#! /usr/bin/env python3

import datetime
import json
import os


def set_days() -> dict:

  tmp_today = datetime.date.today()
  # tmp_today = datetime.date.fromisoformat("2026-08-21")
  return {
    'today':     tmp_today,
    'yesterday': tmp_today - datetime.timedelta(days = 1),
    'tomorrow':  tmp_today + datetime.timedelta(days = 1),
  }


def get_config(_path: str) -> dict:

  json_file = os.path.join(_path, 'my_python_sunrise_sunset.json')
  if os.path.isfile(json_file):
    with open(json_file, 'r', encoding = 'utf-8') as ff:
      return json.load(ff)
  else:
    return None


def set_json_path(_path: str, _part: str) -> str:
  return os.path.join(_path, 'my_python_sunrise_sunset..%s.json' %(_part))


def set_lock_file_path(_path: str) -> str:
  return os.path.join(_path, 'my_python_sunrise_sunset.LOCK')
