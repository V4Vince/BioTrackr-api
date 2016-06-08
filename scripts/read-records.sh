#!/bin/bash

TOKEN=BAhJIiVmZWYyNmY1OTdmNGUxYTdmNzgzOTg5YmE4NmFiYzRhYgY6BkVG--01e2d85e4f45139b0449d4b07ca34956e9be1043

curl --include --request GET http://localhost:3000/records \
  --header "Authorization: Token token=$TOKEN"
