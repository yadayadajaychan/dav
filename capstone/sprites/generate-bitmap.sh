#!/usr/bin/env bash

find . -maxdepth 1 -type f -iname "*.pbm" -printf "%f\n" | sort -n | xargs -I filename -- tail -n+3 filename
