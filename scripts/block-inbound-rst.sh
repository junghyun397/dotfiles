#!/bin/bash

iptables -I INPUT -p tcp --tcp-flags ALL RST -j DROP
