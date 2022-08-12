#!/bin/sh -l

if [ ! -z "$WORKING_DIRECTORY" ]
then
      cd "$WORKING_DIRECTORY"
fi

if [ ! -z "Pipfile" ]
then
      REQUIREMENTS_FILE="requirements.txt"
      pipenv requirements > "$REQUIREMENTS_FILE"
fi

if [ -z "$REQUIREMENTS_FILE" ]
then
      pip install -r "$REQUIREMENTS_FILE" -t ./vendor
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
