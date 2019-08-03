#! /bin/bash

echo -n "Enter your github username: "
read USER_NAME

echo -n "Enter the branch name you want to build: "
read BRANCH

if [[ ${USER_NAME} == "" ]]; then
    echo "Please enter a your github  username!"
    exit 1
else
    echo "GitHub username : ${USER_NAME}"
fi

if [[ ${BRANCH} == "" ]]; then
    echo "Please enter a valid branch name!"
    exit 1
else
    echo "Building on branch : ${BRANCH}"
fi

curl -u ${CIRCLECI_TOKEN} \
     -d '{"build_parameters": {"[CIRCLE_JOB]":"build"}}' \
     https://circleci.com/api/v1.1/project/github/${USER_NAME}/csye6225-su19-lambda/tree/${BRANCH}
