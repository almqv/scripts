#!/usr/bin/env bash
upower -i `upower -e | grep 'BAT'` | grep percentage | awk '{print $2}'

