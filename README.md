# Flutter-Sample-Ramenian-App
![app screenshot](https://raw.githubusercontent.com/JayJayDee/Flutter-Sample-Ramenian-App/master/images/screenshot_01.png)

Flutter sample app. developed for seminar in [handstudio](http://handstudio.net).

## Features
- Remote server data fetching via [dio-http](https://pub.dartlang.org/packages/dio)
- Centralized state management using [scoped_model](https://pub.dartlang.org/packages/scoped_model)
- Other tip & tricks

## Getting started
1. Prepare the VS Code app to your computer.
2. Install Flutter extension on VS Code marketplace.
3. Just clone repository and open it in VS Code, then you're ready to rock!

## REST api specs
this app uses demonstration-purpose rest API. feel free to use it.
### Base URL
```bash
http://ramenian.chatpot.chat
```
### POST /ramen
creates a new random ramen. no parameter needed.
### GET /ramens
returns a all ramens. the response is same as followings.
```json
[
  {
    "id": 5,
    "image": "http://ramenian.chatpot.chat/asset/images-2.jpeg.jpg.jpg",
    "name": "튀김우동",
    "company": "농심",
    "soup": true,
    "tags": [
      "고소한"
    ]
  },
  {
    "id": 25,
    "image": "http://ramenian.chatpot.chat/asset/spagetti.jpg",
    "name": "스파게티",
    "company": "오뚜기",
    "soup": false,
    "tags": []
  }
]
```
### DELETE /ramen/:ramen_id
deletes a ramen. also no parameter needed except `ramen_id` in url.
### GET /ramen/:ramen_id
get a single ramen.
```json
{
  "id": 2,
  "image": "http://ramenian.chatpot.chat/asset/bbm.jpg",
  "name": "비빔면",
  "company": "팔도",
  "soup": false,
  "tags": [
    "비빔면",
    "원조"
  ]
}
```