module Main exposing (..)

-- MODEL

type alias Model =
  Int

initModel : Model

initModel =
  0

-- UPDATE
type Msg = AddCalorie | Clear

update: Msg -> Model -> Model
update msg model =
  case msg of
    AddCalorie ->
      model + 1

    Clear ->
      initModel

-- VIEW
view : Model -> Html Msg
