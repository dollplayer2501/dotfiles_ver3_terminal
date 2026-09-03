> [!NOTE]
> Link this directory to `~/.local/bin/` and `chmod 0755`.  
> It stores scripts written in Python that would normally be written as Fish shell scripts.

The following Python script is not intended to be used on its own.


## `my_python_sec_to_regular_time.py`

Convert the number of seconds into a normalized time format, for example, `1wk 1d 1hr 1min`.  
Used with Conky and Fastfetch.


## `my_python_sunrise_sunset_*.*`

> [!NOTE]
> Does not support the midnight sun or polar night.


Fetch information by calling the sunrise-sunset.org API.
Instead of calling the API every time, only call it if data corresponding to the system date (plus or minus one day) does not exist in `/tmp`.  
Used with Conky.

### `my_python_sunrise_sunset_get.py`

Normally, when this is launched, it retrieves information from the sunrise/sunset JSON file in `/tmp` if that file exists.

### `my_python_sunrise_sunset_set.py`, `my_python_sunrise_sunset.json`

Call the sunrise-sunset.org API to retrieve data for yesterday, today, and tomorrow, and store it in `/tmp`.

