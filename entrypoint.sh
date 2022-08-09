#!/bin/sh -l

if [ ! -z "$WORKING_DIRECTORY" ]
then
      cd "$WORKING_DIRECTORY"
fi

if [ ! -z "$REQUIREMENTS_FILE" ]
then
      pip install -r "$REQUIREMENTS_FILE" -t ./vendor
else
      if [ ! -z "Pipfile" ]
      then
            pipenv install --system --deploy --keep-outdated
      fi
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
