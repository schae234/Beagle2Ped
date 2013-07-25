#!/bin/sh

# Full path to the pipeline
PIPE=`dirname $0`
BGL_TO_PED="$PIPE/bgl_to_ped"
SEARCH="$PIPE/search"


if [ $# -lt 2 ]; then
  echo -e "USAGE:\t$0\t[bgl file] [ped file]"
  exit
fi

BGL=$1
PED=$2

OUT=$BGL

awk '{ print $1,$2,$3,$4,$5,$6; }' $PED > $OUT.fam
$BGL_TO_PED \
$BGL \
$OUT.fam 0 \
> $OUT.ped
