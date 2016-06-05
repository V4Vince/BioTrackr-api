#!/bin/bash

curl --include --request POST http://localhost:3000/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'

  curl --include --request POST http://localhost:3000/sign-in \
    --header "Content-Type: application/json" \
    --data '{
      "credentials": {
        "email": "Vince@gmail.com",
        "password": "qwer"
      }
    }'

  curl --include --request POST http://localhost:3000/sign-in \
    --header "Content-Type: application/json" \
    --data '{
      "credentials": {
        "email": "Guo@gmail.com",
        "password": "qwer"
      }
    }'
