#!/bin/sh -l

set -o xtrace

if [ ! -z "$WORKING_DIRECTORY" ]
then
      cd "$WORKING_DIRECTORY"
fi

if [ ! -z "Pipfile" ]
then
      REQUIREMENTS_FILE="requirements.txt"
      pipenv requirements > "$REQUIREMENTS_FILE"
fi

if [ ! -z "$REQUIREMENTS_FILE" ]
then
      echo "Installing Dependencies using pip -r $REQUIREMENTS_FILE"
      command="pip install -r $REQUIREMENTS_FILE -t ./vendor"
      eval $command
fi

if ! [ -z "$PROJECT_DIR" ]
then
      projectDirSubCommand="--project-dir $PROJECT_DIR"
fi

if ! [ -z "$STAGE" ]
then
      stageSubCommand="--stage $STAGE"
fi

command="chalice $projectDirSubCommand $OPERATION $stageSubCommand"

eval $command
