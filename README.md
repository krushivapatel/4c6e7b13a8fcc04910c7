Steps to access API for twitter-app

1) rails db:create

2) rails db:migrate

3) rails s

List of APIs

1) User registration

URL: localhost:3000/users \
Method: POST \
Headers: \
&nbsp;Content-type: application/json \
Request parameters: \
{\
&nbsp;"user": {\
&nbsp;&nbsp;"email": "test@gmail.com",\
&nbsp;&nbsp;"password": "123456",\
&nbsp;&nbsp;"password_confirmation": "123456"\
&nbsp;}\
}\
Expected result: \
{ \
&nbsp;"success": true, \
&nbsp;"message": "Registration successful.", \
&nbsp;"user": { \
&nbsp;&nbsp;"id": 3, \
&nbsp;&nbsp;"email": "test@gmail.com", \
&nbsp;&nbsp;"auth_token": "xv2zMwFs9jZ9_Ls7_v6s", \
&nbsp;&nbsp;"created_at": "2020-09-07T06:51:50.931Z", \
&nbsp;&nbsp;"updated_at": "2020-09-07T06:51:50.931Z" \
&nbsp;} \
}

2) User login

URL: localhost:3000/users/sign_in \
Method: POST \
Headers: \
&nbsp;Content-type: application/json \
Request parameters: \
{\
&nbsp;"user": {\
&nbsp;&nbsp;"email": "test@gmail.com",\
&nbsp;&nbsp;"password": "123456"\
&nbsp;}\
}\
Expected result: \
{ \
&nbsp;"success": true, \
&nbsp;"message": "Login successful", \
&nbsp;"user": { \
&nbsp;&nbsp;"id": 3, \
&nbsp;&nbsp;"email": "test@gmail.com", \
&nbsp;&nbsp;"auth_token": "xv2zMwFs9jZ9_Ls7_v6s", \
&nbsp;&nbsp;"created_at": "2020-09-07T06:51:50.931Z", \
&nbsp;&nbsp;"updated_at": "2020-09-07T06:51:50.931Z" \
&nbsp;} \
}

3) User logout

URL: localhost:3000/users/sign_out \
Method: DELETE \
Headers: \
&nbsp;Content-type: application/json \
&nbsp;Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
{\
&nbsp;"success": true,\
&nbsp;"message": "Logged out successful"\
}

4) Follow user

URL: localhost:3000/relationships \
Method: POST \
Headers: \
&nbsp;Content-type: application/json \
&nbsp;Authorization: iJo-J814EjY7U86QASJK \
Request parameters: \
{\
&nbsp;"followed_id":1\
}\
Expected result: \
{\
&nbsp;"success": true,\
&nbsp;"message": "Successfully followed this user."\
}

5) Unfollow user

URL: localhost:3000/relationships/1 \
Method: DELETE \
Headers: \
&nbsp;Content-type: application/json \
&nbsp;Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
{\
&nbsp;"success": true,\
&nbsp;"message": "Successfully unfollowed this user."\
}

6) Create tweets

URL: localhost:3000/tweets \
Method: POST \
Headers: \
&nbsp;Content-type: application/json \
&nbsp;Authorization: iJo-J814EjY7U86QASJK \
Request parameters: \
{\
&nbsp;"tweet": {\
&nbsp;&nbsp;"content": "My first tweet"\
&nbsp;}\
}\
Expected result: \
{\
&nbsp;"id": 3,\
&nbsp;"content": "My first tweet",\
&nbsp;"created_at": "2020-09-07T07:15:05.743Z",\
&nbsp;"user": {\
&nbsp;&nbsp;"id": 1,\
&nbsp;&nbsp;"email": "krushiva.patel@tatvasoft.com"\
&nbsp;}\
}

7) List of tweets

URL: localhost:3000/tweets?user_id=3 \
Method: GET \
Headers: \
&nbsp;Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
[\
&nbsp;{\
&nbsp;&nbsp;"id": 3,\
&nbsp;&nbsp;"content": "My first tweet",\
&nbsp;&nbsp;"created_at": "2020-09-07T07:15:05.743Z",\
&nbsp;&nbsp;"user": {\
&nbsp;&nbsp;&nbsp;"id": 1,\
&nbsp;&nbsp;&nbsp;"email": "krushiva.patel@tatvasoft.com"\
&nbsp;&nbsp;}\
&nbsp;}\
]

8) Get current user's profile

URL: localhost:3000/profile \
Method: GET \
Headers: \
&nbsp;Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
{\
&nbsp;"id": 3,\
&nbsp;"email": "test@gmail.com",\
&nbsp;"followers": [],\
&nbsp;"following": [\
&nbsp;&nbsp;{\
&nbsp;&nbsp;&nbsp;"id": 1,\
&nbsp;&nbsp;&nbsp;"email": "krushiva.patel@tatvasoft.com"\
&nbsp;&nbsp;},\
&nbsp;&nbsp;{\
&nbsp;&nbsp;&nbsp;"id": 2,\
&nbsp;&nbsp;&nbsp;"email": "krushivapatel@gmail.com"\
&nbsp;&nbsp;}\
&nbsp;]\
}

9) Get other user's profile

URL: localhost:3000/user_profile/1 \
Method: GET \
Headers: \
&nbsp;Authorization: iJo-J814EjY7U86QASJK \
Expected result: \
{\
&nbsp;"id": 1,\
&nbsp;"email": "krushiva.patel@tatvasoft.com",\
&nbsp;"followers": [\
&nbsp;&nbsp;{\
&nbsp;&nbsp;&nbsp;"id": 3,\
&nbsp;&nbsp;&nbsp;"email": "test@gmail.com"\
&nbsp;&nbsp;}\
&nbsp;],\
&nbsp;"following": []\
}