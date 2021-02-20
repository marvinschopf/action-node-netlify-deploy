#!/bin/bash

# Export token to use with netlify's cli
export NETLIFY_SITE_ID=$NETLIFY_SITE_ID
export NETLIFY_AUTH_TOKEN=$NETLIFY_AUTH_TOKEN

yarn global add netlify-cli

COMMAND="netlify deploy --dir=$BUILD_DIRECTORY --functions=$FUNCTIONS_DIRECTORY --message=\"$INPUT_NETLIFY_DEPLOY_MESSAGE\""

if [[ $NETLIFY_DEPLOY_TO_PROD == "true" ]]
then
	COMMAND+=" --prod"
elif [[ -n $DEPLOY_ALIAS ]]
then
	COMMAND+=" --alias $DEPLOY_ALIAS"
fi

# Deploy with netlify
eval $COMMAND
