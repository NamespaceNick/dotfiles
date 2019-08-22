#!/usr/bin/env bash

# Creates an ssh key for the machine
# TODO: Need to bypass the verification dialogs for this command
ssh-keygen -t rsa -b 4096 -C "ndwill@umich.edu"
