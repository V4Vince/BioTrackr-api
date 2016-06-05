#!/bin/bash

TOKEN=BAhJIiVmNDUwYjk4YWVlMmEyMDhiZThmZGQ5MTE0YmJjNTc3MwY6BkVG--4770d6e9fa7ef332b5be1c2780e4e8c3ca5be0ce
ID=2

curl --include --request PATCH http://localhost:3000/records/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "record": {
      "details": "My updated details"
    }
  }'
