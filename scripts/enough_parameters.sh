#!/bin/bash

number_of_expected_args=4
E_WRONG_ARGS=85
script_parameters="-a -h -m -z"
# -a = all, -h = help, etc.

if [ $# -ne  "$number_of_expected_args" ]; then
  echo "Usage: $(basename "$0") $script_parameters"
  exit $E_WRONG_ARGS
fi