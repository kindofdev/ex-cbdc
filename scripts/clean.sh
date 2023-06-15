#!/bin/sh

for PACKAGE in $1/package/main/daml/* $1/.; do
  rm -rf "$PACKAGE/.daml"
  rm -rf "$PACKAGE/.lib"
done
