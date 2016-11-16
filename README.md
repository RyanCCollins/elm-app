# Elm Apps
Simple collection of elm apps written by me.

## Score Keeper

### Model

```
Model =
  { players : List Player
  , playerName : String
  , playerId : Maybe Int
  , plays : List Play
  }
```

Player Model
```
Player = {
  id : Int,
  name : String,
  points : Int
}
```

Play Model
```
Play = {
  id: Int,
  playerId: Int,
  name : String,
  points : Int
}
```

TODO Initial Model

## Update
* Edit
* Score
* Input
* Save
* Cancel
* DeletePlay

TODO: Create Message Union Type

## View
What are the logical sections of UI?
