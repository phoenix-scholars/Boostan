#!/bin/bash

BOOSTAN_VERSION=branches/0.1.1
BOOSTAN_REPO_PATH=https://github.com/phoenix-scholars/Boostan


BOOSTAN_BIN_DIR=$BOOSTAN_INS_DIR/bin
BOOSTAN_DOC_DIR=$BOOSTAN_INS_DIR/doc
BOOSTAN_STY_DIR=$BOOSTAN_INS_DIR
BOOSTAN_WRK_DIR=$PWD

BOOSTAN_COMMAND=
BOOSTAN_VERBOSE=false

 
while getopts ":c:vV" opt; do
	case $opt in
		c)
			BOOSTAN_COMMAND=$OPTARG
			boostan_log "The command is : %s"  "$OPTARG"
			;;
		V)
			BOOSTAN_VERBOSE=true
			boostan_log "The verbose mode is active"
			;;
		v)
			BOOSTAN_COMMAND=version
			boostan_log "The command is set to version"
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done



function boostan_configure_print(){
	boostan_log_print_header "Here is the configuration table"
	boostan_log_print PROJECT_PATH "$PROJECT_PATH"
	boostan_log_print PROJECT_FULL_PATH "$PROJECT_FULL_PATH"
	boostan_log_print PROJECT_NAME  "$PROJECT_NAME"
	boostan_log_print_footer
}