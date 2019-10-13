#!/bin/bash

for file in $1; do unzip -d "${file%.*}" "$file"; done
