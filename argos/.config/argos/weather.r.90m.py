#!/usr/bin/env python3

import requests
import geocoder
import os, sys
import json

def weather(location="", metric=True):
        url = "http://wttr.in/%s?format=1%s" % (location, "&u" if not metric else "&m")
        r = requests.get(url)
        weather = r.text.rstrip("\n")
        city = geocoder.ip("me").city if not location else location.split(',')[0]
        # Check that we were actually sent weather info
        if "°F" in weather or "°C" in weather:
                # There seems to be a really strange
                # character being inserted here,
                return (weather[0:1] + weather[2:]).replace('  ', ' ')
        else:
                return None

def main():
        try:
                with open(os.path.expanduser("~/.secrets/secrets.json")) as f:
                        secrets = json.load(f)
                        location = secrets["weather_location"]
        except Exception:
                print("Failed to load secrets.json")
                return 1
        print(weather(location=location))

if __name__ == "__main__":
        ret = main()
        if ret:
                sys.exit(ret)
