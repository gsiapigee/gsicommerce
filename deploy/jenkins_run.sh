#!/bin/bash

app=$1
# set to use the profile
profile=$2
passwd=$3
# set Password for prod deployments(optional)
PASSWORD=yourwish


# Check for empty parameters
if [ -z $app ]
then
  echo "App parameter not set"
  exit -1   
fi

if [ -z $profile ]
then
    echo "Profile parameter not set"
    exit 1
fi
# checking password before doing prod deployments
if [ "$profile" == "prod-env" ]
then
    if [ -n "$passwd" ]
      then
          if [ "$passwd" != "$PASSWORD" ]
             then
                echo "Password incorrect"
                exit -1
          fi        
      else
         echo "no password, can not deploy prod"
         exit -1
    fi
fi

if [ $app == "All" ]
then    
    echo "$app"
    bash deploy_all.sh $profile  || exit 1 
else
    echo "$app"
    # source in the deploy_func.sh file
    . deploy_func.sh
    deploy_app $app $profile   || exit 1
fi


