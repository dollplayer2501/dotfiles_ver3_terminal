#! /usr/bin/env python3

import json
import os
import requests
import shutil
import sys
import tempfile
import time

import my_python_sunrise_sunset_functions as ssf


# NOTE:
#  - Since data is being written to tmpfs, the files are deleted only upon reboot (not upon login or logout).

# TODO:
#  - Adapting to the Midnight Sun and Polar Night
#


if __name__ == "__main__":

  #
  # Get environment
  #

  this_path = os.path.dirname(os.path.abspath(__file__))
  temporary_path = tempfile.gettempdir()


  #
  # Lock file
  #

  lock_file = ssf.set_lock_file_path(temporary_path)

  try:
    # Create the file if it does not exist; raise FileExistsError if it does.
    # The O_EXCL flag allows the file existence check and creation to be performed simultaneously (atomically).

    fd = os.open(lock_file, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
  except FileExistsError:
    sys.exit()


  # time.sleep(10)


  #
  # Set date
  #

  dict_date = ssf.set_days()


  #
  # Get config
  #

  config = ssf.get_config(this_path)
  if None == config:
    sys.exit(-1)


  #
  # Kick API and get json data
  #

  for idx, val in enumerate(dict_date):

    tmp_api_url = config['url'] % (
      config['lat'], config['lng'], config['tzid'],
      dict_date[val]
    )

    tmp_json = ssf.set_json_path(temporary_path, val)

    try:
      response = requests.get(tmp_api_url)
    except Exception as e:
      # print(f"Error type:    {type(e).__name__}")
      # print(f"Error details: {e}")
      sys.exit(-1)

    data = response.json()

    with tempfile.NamedTemporaryFile(mode = 'w+', encoding = 'utf-8', delete = True, delete_on_close = True) as temp_file:
      json.dump(data, temp_file, ensure_ascii = False, indent = 2)
      temp_file.flush()
      shutil.copy(temp_file.name, tmp_json)

    if idx != len(dict_date) - 1:
      time.sleep(config['sleep'])


  #
  #
  #

  os.close(fd)
  os.remove(lock_file)

  sys.exit()
