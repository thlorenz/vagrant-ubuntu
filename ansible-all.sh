#!/usr/bin/env bash

ansible-playbook --extra-vars="@ansible/all.json" ansible/ubuntu.yml
