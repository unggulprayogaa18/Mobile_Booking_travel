#!/usr/bin/env bash
# Author : D
# Script for flutter build_runner:
shopt -s expand_aliases
export skip_runner=false
export force=false
export clean=false
export buildWeb=false

while test $# -gt 0; do
  case "$1" in
  -h | --help)
    echo "initialize [options]"
    echo " "
    echo "options:"
    echo "-c,     --clean               clean project folder"
    echo "-s,     --skip-runner         skip build_runner"
    echo "-f,     --force               force delete conflicting outputs"
    echo "-bw,    build web"
    exit 0
    ;;
  -c | --clean)
    export clean=true
    shift
    ;;
  -s | --skip-runner)
    export skip_runner=true
    shift
    ;;
  -f | --force)
    export force=true
    shift
    ;;
  *)
    echo "Unknown argument ${1}"
    exit
    break
    ;;
  esac
done

if ! command -v fvm &>/dev/null; then
  echo 'Using flutter'
  alias f="flutter"
else
  echo 'Using fvm'
  fvm install
  alias f="fvm flutter"
fi

function buildRunner() {
  if $force; then
    f packages pub run build_runner build --delete-conflicting-outputs
  else
    f packages pub run build_runner build
  fi
}

function startBuild() {
  if $clean; then
    f clean
  fi
  f packages pub get
  if ! $skip_runner; then
    buildRunner
  fi
}

echo 'Root - Run Script'
startBuild
