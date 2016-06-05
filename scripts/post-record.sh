#!/bin/bash

TOKEN=BAhJIiVmNDUwYjk4YWVlMmEyMDhiZThmZGQ5MTE0YmJjNTc3MwY6BkVG--4770d6e9fa7ef332b5be1c2780e4e8c3ca5be0ce

curl --include --request POST http://localhost:3000/records \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "record": {
      "symptom": "felt dizzy",
      "date": "2016-01-02",
      "details": "felt really dizzy in the morning"
    }
  }'
