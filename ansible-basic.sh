#!/usr/bin/env bash

ansible-playbook --extra-vars="@ansible/basic.json" ansible/ubuntu.yml
