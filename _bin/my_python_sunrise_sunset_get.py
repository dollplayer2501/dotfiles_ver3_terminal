#! /usr/bin/env python3

import datetime
import json
import os
import subprocess
import sys
import tempfile
# import time

import my_python_sunrise_sunset_functions as ssf


def exec_script():
  this_path = os.path.dirname(os.path.abspath(__file__))
  script_path_name = os.path.join(this_path, 'my_python_sunrise_sunset_set.py')

  exec_args = [ 'python3', script_path_name, ]
  proc = subprocess.Popen(exec_args)


if __name__ == "__main__":

  #
  # Get environment
  #

  temporary_path = tempfile.gettempdir()


  #
  # Set date
  #

  dict_date = ssf.set_days()


  #
  # Json file exist?
  #   This file exists in `/tmp/`.
  #   - my_python_sunrise_sunset..today.json
  #   - my_python_sunrise_sunset..tomorrow.json
  #   - my_python_sunrise_sunset..yesterday.json
  #   If these files do not exist, they are generated using `my_python_sunrise_sunset_set.py`.
  #

  json_file = ssf.set_json_path(temporary_path, 'today')
  if not os.path.isfile(json_file):
    exec_script()
    sys.exit()


  #
  # Is that file dated today?
  #

  with open(json_file, 'r', encoding = 'utf-8') as ff:
    json_data = json.load(ff)

  try:
    tmp_today_date = datetime.date.fromisoformat(json_data['results']['sunrise'][0:10])
  except Exception as e:
    print(f"Error type:    {type(e).__name__}")
    print(f"Error details: {e}")
    sys.exit(-1)

  if tmp_today_date != dict_date['today']:
    exec_script()
    sys.exit()


  #
  #
  #

  purse_json = lambda key: datetime.time.fromisoformat(json_data['results'][key][11:19])

  exec_args = [
    'my_python_sec_to_regular_time.py',
    str(json_data['results']['day_length']),
  ]
  result = subprocess.run(exec_args, capture_output = True, text = True)
  day_length_str = result.stdout.strip()

  print(
    purse_json('astronomical_twilight_begin'),
    purse_json('nautical_twilight_begin'),
    purse_json('civil_twilight_begin'),
    purse_json('sunrise'),
    purse_json('solar_noon'),
    purse_json('sunset'),
    purse_json('civil_twilight_end'),
    purse_json('nautical_twilight_end'),
    purse_json('astronomical_twilight_end'),
    json_data['results']['day_length'],
    day_length_str,
  )

  sys.exit()
