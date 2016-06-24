#!/usr/bin/env bash

ansible-playbook --extra-vars="@ansible/barebones.json" ansible/ubuntu.yml
