#!/bin/bash
# test script 
# script is to see how jq can extrapolate the variables
# useful for downloading the artifacts 
# set -x 
echo "Testing api call simulation"
# check the length of the children array 
END=$(cat data.json | jq '.children' | jq '. | length')
echo "END variable $END"
for ((i=0;i<END;i++)); do
    cat data.json | jq --arg i "$i" '.children[$i | tonumber].uri' | grep "tar"
done
# jq --arg i "$i" '.results[$i | tonumber]'
