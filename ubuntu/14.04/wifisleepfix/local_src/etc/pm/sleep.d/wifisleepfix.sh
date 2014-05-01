#!/bin/sh

case "${1}" in
        resume|thaw)
        restart network-manager
                ;;
esac