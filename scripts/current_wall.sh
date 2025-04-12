#!/bin/env bash
swww query | awk '/currently/ {print $8}'
