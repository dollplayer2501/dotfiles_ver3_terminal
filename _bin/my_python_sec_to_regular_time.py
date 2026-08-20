#! /usr/bin/env python3

# 1 minute:           60 seconds
# 1 hour:          3,600 seconds
# 1 day:          86,400 seconds
# 1 week:        604,800 seconds
# 1 month:               Not yet implemented
# 1 year:                Not yet implemented
# Beyond that:           Not yet implemented


import argparse
import sys


#
#
#

if __name__ == "__main__":

  total_seconds = None

  parser = argparse.ArgumentParser()
  parser.add_argument('number', type=str, nargs='?', help='') # Support for pipe
  args = parser.parse_args()
  # print(args)

  #

  unknown_number = None

  if args.number is not None:
    # via argument
    unknown_number = args.number
  elif not sys.stdin.isatty():
    # via pipe
    unknown_number = str(sys.stdin.read())
  else:
    parser.error('seconds is required')
  # print(unknown_number)

  #

  total_seconds = None
  cleaned_value = unknown_number.replace(",", "")
  try:
    total_seconds = int(float(cleaned_value))
  except ValueError:
    parser.error(f"seconds is number, `{unknown_number.strip()}` is not number")
  # print(total_seconds)


  # Definition of seconds for each unit

  SEC_IN_MINUTE = 60
  SEC_IN_HOUR   = 60 * 60
  SEC_IN_DAY    = 24 * SEC_IN_HOUR
  SEC_IN_WEEK   =  7 * SEC_IN_DAY

  # Calculation of weeks, days, hours, minutes, and seconds

  weeks = total_seconds // SEC_IN_WEEK
  rem = total_seconds % SEC_IN_WEEK

  days = rem // SEC_IN_DAY
  rem %= SEC_IN_DAY

  hours = rem // SEC_IN_HOUR
  rem %= SEC_IN_HOUR

  minutes = rem // SEC_IN_MINUTE
  seconds = rem % SEC_IN_MINUTE

  # print(weeks, days, hours, minutes, seconds)


  #
  # Display
  #

  display_str = ''

  if total_seconds < SEC_IN_HOUR:

    display_str += (f"{minutes}min") if minutes > 0 else '0min'
    display_str += (f" {seconds}sec") if seconds > 0 else ' 0sec'

  elif total_seconds < SEC_IN_DAY:

    display_str += f"{hours}hr"
    display_str += (f" {minutes}min") if minutes > 0 else ' 0min'
    display_str += (f" {seconds}sec") if seconds > 0 else ' 0sec'

  elif total_seconds < SEC_IN_WEEK:

    display_str += f"{days}d"
    display_str += (f" {hours}hr") if hours > 0 else ' 0hr'
    display_str += (f" {minutes}min") if minutes > 0 else ' 0min'

  else:

    display_str += f"{weeks}wk"
    display_str += (f" {days}d") if days > 0 else ' 0d'
    display_str += (f" {hours}hr") if hours > 0 else ' 0hr'
    display_str += (f" {minutes}min") if minutes > 0 else ' 0min'


  print(display_str)
  sys.exit()
