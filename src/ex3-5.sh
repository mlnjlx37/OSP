#!/bin/sh

run_ls() {
	OPTIONS="$*"

	COMMAND_STRING="ls $OPTIONS"

	echo "실행할 명령어: $COMMAND_STRING"
	eval "$COMMAND_STRING"
}

run_ls "$@"

exit 0
