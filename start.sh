#!/bin/sh

piactl login creds.txt
piactl set protocol wireguard
piactl background enable
piactl connect
