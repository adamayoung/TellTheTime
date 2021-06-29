#!/bin/sh

set -e


# Pull Request
if [[ -n $CI_PULL_REQUEST_NUMBER ]];
then
    # SwiftLint
    cd $CI_WORKSPACE
    brew install swiftlint
    swiftlint --strict
fi
