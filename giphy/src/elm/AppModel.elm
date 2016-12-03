module AppModel exposing (..)

type alias Model =
  { input: String }

type Msg
  = Input String
  | Submit


initModel : Model
initModel =
  { input = "" }

update : Msg -> Model -> Model
update msg model =
  case msg of
    Input value ->
      { model | input = value }
    Submit ->
      model
