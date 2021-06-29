#!/bin/sh

set -e

# Pull Request
if [[ -n $CI_PULL_REQUEST_NUMBER ]];
then
    echo "Linting..."
    ./perform_lint.sh
fi
