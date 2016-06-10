# BioTrackr API
An API to store let users store keep a detailed log of their health. It allow users to register with email and password as well as store records that they create.

API currently does not support admin privileges. All data created by the user are only accessible by the user. 

##API end-points

| Verb   | URI Pattern            | Controller#Action |
| ----   | -----------            | ----------------- |
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| DELETE | `/sign-out/:id`        | `users#signout`   |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| GET    | `/records`             | `records#index`   |
| POST   | `/records`             | `records#create`  |
| GET    | `/records/:id`         | `records#show`    |
| PATCH  | `/records/:id`         | `records#update`  |

All data returned from API actions is formatted as JSON.

---

## User actions

*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/sign-up`</td>
<td><strong>credentials</strong></td>
<td>201, Created</td>
<td><strong>user</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/sign-in`</td>
<td><strong>credentials</strong></td>
<td>200 OK</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/sign-out/:id`</td>
<td>empty</td>
<td>201 Created</td>
<td>empty</td>
</tr>
<tr>
<td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/change-password/:id`</td>
<td><strong>passwords</strong></td>
<td>204 No Content</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### signup

The `create` action expects a *POST* of `credentials` identifying a new user to
 create, e.g. using `getFormFields`:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
  <input name="credentials[password_confirmation]" type="password" value="an example password">
</form>

```

or using `JSON`:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password",
    "password_confirmation": "an example password"
  }
}
```

The `password_confirmation` field is optional.

If the request is successful, the response will have an HTTP Status of 201,
 Created, and the body will be JSON containing the `id` and `email` of the new
 user, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be empty.

### signin

The `signin` action expects a *POST* with `credentials` identifying a previously
 registered user, e.g.:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
</form>
```

or:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password"
  }
}
```

If the request is successful, the response will have an HTTP Status of 200 OK,
 and the body will be JSON containing the user's `id`, `email`, and the `token`
 used to authenticate other requests, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "an example authentication token"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 401
 Unauthorized, and the response body will be empty.

### signout

The `signout` actions is a *DELETE* specifying the `id` of the user so sign out.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful, the response will have a status of 401
 Unauthorized.

### changepw

The `changepw` action expects a PATCH of `passwords` specifying the `old` and
 `new`.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful the reponse will have an HTTP status of 400 Bad
 Request.

---

The `sign-out` and `change-password` requests must include a valid HTTP header
 `Authorization: Token token=<token>` or they will be rejected with a status of
 401 Unauthorized.

## Application Actions

All application requests must include a valid HTTP header `Authorization: Token
 token=<token>` or they will be rejected with a status of 401 Unauthorized.

All of the application actions must follow the *RESTful* style.


Records are associated with users.
Users must be signed in with a token to retrieve a record. 
If this requirement is unmet, the response will be 401 Unauthorized.

*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>GET</td>
<td>`/records`</td>
<td>n/a</td>
<td>200, OK</td>
<td><strong>records found</strong></td>
</tr>
<tr>
  <td colspan="3">
  The default is to retrieve all records associated with the user..
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/records`</td>
<td>n/a</td>
<td>201, Created</td>
<td><strong>record created</strong></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
<td>GET</td>
<td>`/records/:id`</td>
<td>n/a</td>
<td>200, OK</td>
<td><strong>record found</strong</td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>404 Not Found</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/records/:id`</td>
<td><em>empty</em></td>
<td>200, OK</td>
<td><strong>record updated</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/records/:id`</td>
<td><strong>record delta</strong></td>
<td>200, OK</td>
<td><strong>record updated</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>404 Not Found</td>
  <td><em>empty</em></td>
</tr>
</table>

### index

The `index` action is a *GET* that retrieves all the records associated with a
 user.
The response body will contain JSON containing an array of records, e.g.:

```json
{
  "records": [
    {
      "id": 1,
      "symptom": "High fever",
      "date": "2016-03-12",
      "details": "Woke up with a fever today. It lasted for about 1-week",
      "user_id": 9
    },
  ]
}
```

If there are no records associated with the user, the response body will contain
 an empty records array, e.g.:

```json
{
  "records": [
  ]
}
```

### create

The `create` action expects a *POST* with an empty body (e.g `''` or `'{}'` if
 JSON).
If the request is successful, the response will have an HTTP Status of 201
 Created, and the body will contain JSON of the created record with `user_id` set
to the user calling `create`, e.g.:

```json
  {
    "record": {
      "id": 1,
      "symptom": "",
      "date": "",
      "details": "",
      "user_id": 9
    },
 }
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be JSON describing the errors.

### show

The `show` action is a *GET* specifing the `id` of the record to retrieve.
If the request is successful the status will be 200, OK, and the response body
will contain JSON for the record requested, e.g.:

```json
{
  "record": {
      "id": 1,
      "symptom": "High fever",
      "date": "2016-03-12",
      "details": "Woke up with a fever today. It lasted for about 1-week",
      "user_id": 9
    },
  }

```

#### update a record's states

This `update` action expects a *PATCH* with changes to to an existing record's details,
 e.g.:

```html
<form>
  <input details="record.details" type="text" value="Woke up with a fever today. It lasted for about 1.5-weeks">
</form>
```

```json
{
  "record": {
      "id": 1,
      "details": "Woke up with a fever today. It lasted for about 1.5-week",
    },
  }
```

If the request is successful, the response will have an HTTP Status of 200 OK,
 and the body will be JSON containing the modified record, e.g.:

```json
{
  "record": {
      "id": 1,
      "symptom": "High fever",
      "date": "2016-03-12",
      "details": "Woke up with a fever today. It lasted for about 1.5-week",
      "user_id": 9
    },
  }
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be JSON describing the errors.
