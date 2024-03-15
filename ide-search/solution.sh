#!/bin/sh

ide_search() {
  s=$1      # string
  sl=${#s}  # string length
  f=$2      # filename to match
  fl=${#f}  # filename length
  sp=0      # current position in string
  fp=0      # current position in filename
  while [ $fp -lt "$fl" ]; do
    sc="$(echo "$s" | cut -b$((sp + 1))- | cut -b-1)"
    fc="$(echo "$f" | cut -b$((fp + 1))- | cut -b-1)"
    if [ $sp -lt "$sl" ] && [ "$sc" = "$fc" ]; then
      sp=$((sp + 1))
    fi
    fp=$((fp + 1))
  done
  [ $sp -eq "$sl" ]
}

ide_search "crdl"    "crocodile.txt" && echo PASS || echo FAIL
ide_search "le"      "crocodile.txt" && echo PASS || echo FAIL
ide_search "el"      "crocodile.txt" && echo FAIL || echo PASS
ide_search "crdelee" "crocodile.txt" && echo FAIL || echo PASS

