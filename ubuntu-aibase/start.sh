#!/bin/bash
/usr/sbin/sshd -D -e -f /etc/ssh/sshd_config_remote_cpp &
jupyter lab
