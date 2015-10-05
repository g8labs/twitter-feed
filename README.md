# Twitter Feed

Very simple REST API that "mimics" twitter feed.

## Endpoints

### GET /tweets.json

```
Response:

[
  {
    'id' : 1,
    'message' : 'This is a sample tweet',
    'username' : 'bilby91'
  },
  ...
  ...
]
```

### GET /tweets/:id.json

```
Response:

{
  'id' : 1,
  'message' : 'This is a sample tweet',
  'username' : 'bilby91'
}
```

### POST /tweets.json

```
Request payload:
{
  'message' : 'Your tweet message',
  'username' : 'your_username'
}

Response:
{
  'id' : 1234, // This is a new id for you tweet
  'message' : 'Your tweet message',
  'username' : 'your_username'
}
```


## Contact

- Martín Fernández (martin.fernandez@g8labs.co)
