#!/bin/bash

nmcli device wifi list | tail -n +2 | grep \* | awk -F" " '{ print $2 " <fc=#CEFFAC>" $5 $6"</fc>" }'
