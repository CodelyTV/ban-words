#!/usr/bin/env bash

source "$PROJECT_HOME/src/ensure.sh"
source "$PROJECT_HOME/src/github.sh"
source "$PROJECT_HOME/src/github_actions.sh"
source "$PROJECT_HOME/src/misc.sh"

main() {
  ensure::env_variable_exist "GITHUB_REPOSITORY"
  ensure::env_variable_exist "GITHUB_EVENT_PATH"
  ensure::total_args 1 "$@"

  export GITHUB_TOKEN="$1"

  local -r commit_sha="$(github_actions::commit_sha)"

  local -r commited_files=$(github::get_commit_modified_files "$commit_sha")

  echo "ESTA ES JAVI"
  echo "$commited_files"

  exit $?
}
