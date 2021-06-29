#!/bin/sh

brew install swiftlint

cd $CI_WORKSPACE
swiftlint --strict
