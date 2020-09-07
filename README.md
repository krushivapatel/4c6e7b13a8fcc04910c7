Steps to access API for twitter-app

1) rails db:create

2) rails db:migrate

3) rails s

List of APIs

1) User registration

URL: localhost:3000/users \
Method: POST \
Headers: \
    Content-type: application/json \
Request parameters: \
{\
	"user": {\
		"email": "test@gmail.com",\
		"password": "123456",\
		"password_confirmation": "123456"\
	}\
}\
Expected result: \
{ \
    "success": true, \
    "message": "Registration successful.", \
    "user": { \
        "id": 3, \
        "email": "test@gmail.com", \
        "auth_token": "xv2zMwFs9jZ9_Ls7_v6s", \
        "created_at": "2020-09-07T06:51:50.931Z", \
        "updated_at": "2020-09-07T06:51:50.931Z" \
    } \
} \

2) User login

URL: localhost:3000/users/sign_in \
Method: POST \
Headers: \
    Content-type: application/json \
Request parameters: \
{\
	"user": {\
		"email": "test@gmail.com",\
		"password": "123456"\
	}\
}\
Expected result: \
{ \
    "success": true, \
    "message": "Login successful", \
    "user": { \
        "id": 3, \
        "email": "test@gmail.com", \
        "auth_token": "xv2zMwFs9jZ9_Ls7_v6s", \
        "created_at": "2020-09-07T06:51:50.931Z", \
        "updated_at": "2020-09-07T06:51:50.931Z" \
    } \
} \

3) User logout

URL: localhost:3000/users/sign_out \
Method: DELETE \
Headers: \
    Content-type: application/json \
    Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
{\
    "success": true,\
    "message": "Logged out successful"\
}\

4) Follow user

URL: localhost:3000/relationships \
Method: POST \
Headers: \
    Content-type: application/json \
    Authorization: iJo-J814EjY7U86QASJK \
Request parameters: \
{\
	"followed_id":1\
}\
Expected result: \
{\
    "success": true,\
    "message": "Successfully followed this user."\
}\

5) Unfollow user

URL: localhost:3000/relationships/1 \
Method: DELETE \
Headers: \
    Content-type: application/json \
    Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
{\
    "success": true,\
    "message": "Successfully unfollowed this user."\
}\

6) Create tweets

URL: localhost:3000/tweets \
Method: POST \
Headers: \
    Content-type: application/json \
    Authorization: iJo-J814EjY7U86QASJK \
Request parameters: \
{\
	"tweet": {\
		"content": "My first tweet"\
	}\
}\
Expected result: \
{\
    "id": 3,\
    "content": "My first tweet",\
    "created_at": "2020-09-07T07:15:05.743Z",\
    "user": {\
        "id": 1,\
        "email": "krushiva.patel@tatvasoft.com"\
    }\
}\

7) List of tweets

URL: localhost:3000/tweets?user_id=3 \
Method: GET \
Headers: \
    Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
[\
    {\
        "id": 3,\
        "content": "My first tweet",\
        "created_at": "2020-09-07T07:15:05.743Z",\
        "user": {\
            "id": 1,\
            "email": "krushiva.patel@tatvasoft.com"\
        }\
    }\
]\

8) Get current user's profile

URL: localhost:3000/profile \
Method: GET \
Headers: \
    Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
{\
    "id": 3,\
    "email": "test@gmail.com",\
    "followers": [],\
    "following": [\
        {\
            "id": 1,\
            "email": "krushiva.patel@tatvasoft.com"\
        },\
        {\
            "id": 2,\
            "email": "krushivapatel@gmail.com"\
        }\
    ]\
}\

9) Get other user's profile

URL: localhost:3000/profile \
Method: GET \
Headers: \
    Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
{\
    "id": 1,\
    "email": "krushiva.patel@tatvasoft.com",\
    "followers": [\
        {\
            "id": 3,\
            "email": "test@gmail.com"\
        }\
    ],\
    "following": []\
}\