# Phonophonia-API
This application is a Ruby on Rails API for storing tracks and playlists for
users.  Users can create, update, and delete tracks, as well as create and delete playlists.
Users can also view tracks and playlists belonging to other users, as well as incorporate
other user's tracks into their own playlists.

[Click Here for demo](https://ripleyofvenus.github.io/Phonophonia/)

API URL:  https://phonophonia.herokuapp.com/

## Screengrab

![Screenshot](https://i.imgur.com/O4w85EB.png)

# Technologies
- Ruby

# Planning
Please see the front-end component of this project for more information about
our planning process, and more: https://github.com/ripleyofvenus/Phonophonia

# Entity Relationship Diagram

![ERD](https://i.imgur.com/u7miQUr.jpg)


# Our development process and problem-solving strategy
After sketching out the ERD and wireframe, I created user stories, and then spent
the next two days working on the back end. For this project I challenged myself with
going for a more complex back end structure than I'd utilized before, with two
resources (tracks and playlists) and a join table. This was precisely the challenge
I was looking for, and I learned so much about ruby through this project.
Over the next week and a half, I returned to my back end to make alterations as
issues arose. Problem solving this time around felt very smooth, and aside from
a few good stumpers, most of my problem-solving was easily navigated with
testing techniques (such as using console.log for feedback), curl scripts,
searching my localhost and deployed API, and looking to the docs for further
guidance.


## Obligatory cute photo

![Obligatory Cute Photo](https://featuredcreature.com/wp-content/uploads/2012/10/Screen+shot+2012-07-22+at+5.32.38+PM2.png)

## API

### Contents
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/tracks`             | `contents#index`   |
| GET    | `/tracks/:id`         | `contents#show`    |
| POST   | `/tracks`             | `tracks#create`  |
| PATCH  | `/tracks/:id`         | `tracks#update`  |
| DELETE | `/tracks/:id`         | `tracks#delete`  |

#### GET /tracks
```sh
API="http://localhost:4741"
URL_PATH="/tracks"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \

```
```sh
sh scripts/Tracks/get-tracks.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
ETag: W/"99816c7bcad771dbe1f9a7e1912f3fb5"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 30ec2d54-de9e-433f-ba45-bc8920eda62d
X-Runtime: 0.026725
Vary: Origin
Transfer-Encoding: chunked
{
   "tracks":[
      {
         "id":1,
         "title":"this",
         "artist":"this????",
         "host_url":"this dude",
         "user_id":1,
         "playlists":[
            {
               "id":1,
               "name":"this",
               "user_id":1,
               "created_at":"2017-11-12T20:19:41.915Z",
               "updated_at":"2017-11-12T20:19:41.915Z"
            },
            {
               "id":1,
               "name":"this",
               "user_id":1,
               "created_at":"2017-11-12T20:19:41.915Z",
               "updated_at":"2017-11-12T20:19:41.915Z"
            }
         ],
         "editable":false
      },
      {
         "id":2,
         "title":"another",
         "artist":"anotheranotheranother",
         "host_url":"rrrrrrrranother",
         "user_id":1,
         "playlists":[
            {
               "id":2,
               "name":"another",
               "user_id":1,
               "created_at":"2017-11-12T20:39:19.681Z",
               "updated_at":"2017-11-12T20:39:19.681Z"
            }
         ],
         "editable":false
      },
      {
         "id":3,
         "title":"title",
         "artist":"artist",
         "host_url":"url",
         "user_id":2,
         "playlists":[

         ],
         "editable":true
      }
   ]
}
```

#### POST /tracks/
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/tracks"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "track": {
      "title": "'"${TITLE}"'",
      "artist": "'"${ARTIST}"'",
      "host_url": "'"${HOSTURL}"'"
    }
  }'

echo
```
```sh
TOKEN=BAhJIiUyNTI4YzBkOTEwNWVlNThiZWFjZTM2Y2FlMmQyOWE4NAY6BkVG--327865af83f5e14d796375c014a4a80c1af1b31b TITLE=title ARTIST=artist HOSTURL=url sh scripts/Tracks/create-track.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
ETag: W/"95dfb7361d2fdf732cb9bda72ca9f83b"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8f097572-61e8-48da-b04e-2067b7463b37
X-Runtime: 0.175790
Vary: Origin
Transfer-Encoding: chunked

{"track":{"id":3,"title":"title","artist":"artist","host_url":"url","user_id":2,"playlists":[],
"editable":true}}
```
#### PATCH /tracks/
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/tracks/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
	"track": {
		"title": "'"${NEWTITLE}"'",
    "artist": "'"${NEWARTIST}"'",
    "host_url": "'"${NEWURL}"'"
	}
}'

echo
```
```sh
TOKEN=s07WgQ+oj8t89G6/yXPw17PI+TB/ktiYLabYhcpokCM=--6/HQxlRuC+GqFE7T769BF37//sl3NukvfMD/4R+YuZ4= ID=59e2284b748200459f15d143 NEWTITLE="new title" NEWARTIST="new artist" NEWURL="new url" sh scripts/tracks/update.sh
```

Response:

```md
HTTP/1.1 204 No Content
Cache-Control: no-cache
X-Request-Id: c43637ea-05dd-4a47-8afd-ed63e4193baf
X-Runtime: 0.070945
Vary: Origin
```
#### DESTROY /tracks/ID
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/tracks/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"

echo

```
```sh
TOKEN=BAhJIiUyNTI4YzBkOTEwNWVlNThiZWFjZTM2Y2FlMmQyOWE4NAY6BkVG--327865af83f5e14d796375c014a4a80c1af1b31b ID=3 sh scripts/Tracks/delete-track.sh
```

Response:

```md
HTTP/1.1 204 No Content
Cache-Control: no-cache
X-Request-Id: d1065e03-ea1d-4c60-bc91-8002e24f1d75
X-Runtime: 0.010664
Vary: Origin

```

### Playlists
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/playlists`             | `playlists#index`   |
| GET    | `/playlists/:id`         | `playlists#show`    |
| POST   | `/playlists`             | `playlists#create`  |
| PATCH  | `/playlists/:id`         | `playlists#update`  |
| DELETE | `/playlists/:id`         | `playlists#delete`  |

#### GET /playlists
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/playlists"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

```
```sh
sh scripts/Playlists/get-playlists.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
ETag: W/"197675b3e40c5c146d94f251734c224a"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e4f993bf-3fc0-492d-b027-b84d9b1ed7ba
X-Runtime: 0.040435
Vary: Origin
Transfer-Encoding: chunked
```

#### POST /playlists/
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/tracks"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "track": {
      "title": "'"${TITLE}"'",
      "artist": "'"${ARTIST}"'",
      "host_url": "'"${HOSTURL}"'"
    }
  }'

echo
```
```sh
TOKEN=BAhJIiUyNTI4YzBkOTEwNWVlNThiZWFjZTM2Y2FlMmQyOWE4NAY6BkVG--327865af83f5e14d796375c014a4a80c1af1b31b NAME=name sh scripts/Playlists/create-playlist.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
ETag: W/"1858e476f2cd107c5ae579a6f87af37e"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0b8e4836-d7df-4c9e-81ec-639144d75f1a
X-Runtime: 0.265702
Vary: Origin
Transfer-Encoding: chunked

{"playlist":{"id":4,"name":"name","user_id":2,"tracks":[],"editable":true}}
~/wdi/Projects/Capstone/Phonophonia-API (dev)
```
#### PATCH /tracks/
```sh

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/playlists/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
 "playlist": {
   "name": "'"${NAME}"'",
      "track_ids": "'"${IDS}"'"
 }
}'

echo
```
```sh
TOKEN=s07WgQ+oj8t89G6/yXPw17PI+TB/ktiYLabYhcpokCM=--6/HQxlRuC+GqFE7T769BF37//sl3NukvfMD/4R+YuZ4= ID=59e2284b748200459f15d143 NAME="new title" IDS=[3,1] sh scripts/Playlists/update.sh
```

Response:

```md
HTTP/1.1 204 No Content
Cache-Control: no-cache
X-Request-Id: c43637ea-05dd-4a47-8afd-ed63e4193baf
X-Runtime: 0.070945
Vary: Origin
```
#### DESTROY /tracks/ID
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/tracks/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"

echo

```
```sh
TOKEN=BAhJIiUyNTI4YzBkOTEwNWVlNThiZWFjZTM2Y2FlMmQyOWE4NAY6BkVG--327865af83f5e14d796375c014a4a80c1af1b31b ID=3 sh scripts/Playlists/delete-playlist.sh
```

Response:

```md
HTTP/1.1 204 No Content
Cache-Control: no-cache
X-Request-Id: d1065e03-ea1d-4c60-bc91-8002e24f1d75
X-Runtime: 0.010664
Vary: Origin

```

### Playlists-Tracks
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/playlists-tracks`    | `playlists-tracks#create`  |
