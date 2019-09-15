#!/bin/bash

sudo ansible-playbook --connection=local --inventory 127.0.0.1, raise.yml
