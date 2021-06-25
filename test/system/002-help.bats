#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load 'libs/helpers.bash'

@test "help: Try to run toolbox with no command (shows usage screen)" {
  run $TOOLBOX

  assert_failure
  assert_line --index 0 "Error: missing command"
  assert_output --partial "Run 'toolbox --help' for usage."
}

@test "help: Run command 'help'" {
  run $TOOLBOX help

  assert_success
  assert_output --partial "toolbox - Unprivileged development environment"
}

@test "help: Use flag '--help' (it should show usage screen)" {
  run $TOOLBOX --help

  assert_success
  assert_output --partial "toolbox - Unprivileged development environment"
}

@test "help: Try to run toolbox with non-existent command (shows usage screen)" {
  run $TOOLBOX foo

  assert_failure
  assert_line --index 0 "Error: unknown command \"foo\" for \"toolbox\""
  assert_line --index 1 "Run 'toolbox --help' for usage."
}

@test "help: Try to run toolbox with non-existent flag (shows usage screen)" {
  run $TOOLBOX --foo

  assert_failure
  assert_line --index 0 "Error: unknown flag: --foo"
  assert_line --index 1 "Run 'toolbox --help' for usage."
}

@test "help: Try to run 'toolbox create' with non-existent flag (shows usage screen)" {
  run $TOOLBOX create --foo

  assert_failure
  assert_line --index 0 "Error: unknown flag: --foo"
  assert_line --index 1 "Run 'toolbox --help' for usage."
}

@test "help: Try to run 'toolbox enter' with non-existent flag (shows usage screen)" {
  run $TOOLBOX enter --foo

  assert_failure
  assert_line --index 0 "Error: unknown flag: --foo"
  assert_line --index 1 "Run 'toolbox --help' for usage."
}

@test "help: Try to run 'toolbox help' with non-existent flag (shows usage screen)" {
  run $TOOLBOX help --foo

  assert_failure
  assert_line --index 0 "Error: unknown flag: --foo"
  assert_line --index 1 "Run 'toolbox --help' for usage."
}

@test "help: Try to run 'toolbox init-container' with non-existent flag (shows usage screen)" {
  run $TOOLBOX init-container --foo

  assert_failure
  assert_line --index 0 "Error: unknown flag: --foo"
  assert_line --index 1 "Run 'toolbox --help' for usage."
}

@test "help: Try to run 'toolbox list' with non-existent flag (shows usage screen)" {
  run $TOOLBOX list --foo

  assert_failure
  assert_line --index 0 "Error: unknown flag: --foo"
  assert_line --index 1 "Run 'toolbox --help' for usage."
}

@test "help: Try to run 'toolbox rm' with non-existent flag (shows usage screen)" {
  run $TOOLBOX rm --foo

  assert_failure
  assert_line --index 0 "Error: unknown flag: --foo"
  assert_line --index 1 "Run 'toolbox --help' for usage."
}

@test "help: Try to run 'toolbox rmi' with non-existent flag (shows usage screen)" {
  run $TOOLBOX rmi --foo

  assert_failure
  assert_line --index 0 "Error: unknown flag: --foo"
  assert_line --index 1 "Run 'toolbox --help' for usage."
}

@test "help: Try to run 'toolbox run' with non-existent flag (shows usage screen)" {
  run $TOOLBOX run --foo

  assert_failure
  assert_line --index 0 "Error: unknown flag: --foo"
  assert_line --index 1 "Run 'toolbox --help' for usage."
}
