module App exposing (main)

import AppModel exposing (..)
import View exposing (view)

import Html exposing (Html)

main : Program Never Model Msg
main =
  Html.beginnerProgram
      { model = initModel
      , view = view
      , update = update
      }
