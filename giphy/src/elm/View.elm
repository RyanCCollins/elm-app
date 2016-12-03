
-- -*- mode: elm; coding: utf-8 -*- --
module View exposing (view)

import AppModel exposing (Model, Msg(..))

import Html exposing (Html)
import Html.Attributes
import Html.Events exposing (onClick)


view : Model -> Html Msg
view model =
  let
    input = Input
    submit = Submit |> onClick
  in
    Html.div [Html.Attributes.attribute "class" "container centered full-height"] [
      Html.div [Html.Attributes.attribute "class" "row"] [
        Html.div [Html.Attributes.attribute "class" "col-xs-12"] [
          Html.div [Html.Attributes.attribute "class" "jumbotron"] [
            Html.h1 [Html.Attributes.attribute "class" "display-3 text-center pad-10 margin-20b"] [Html.text "Giphy Search"]
            , Html.form [Html.Attributes.attribute "class" "form-inline centered"] [
              Html.div [Html.Attributes.attribute "class" "form-group"] [
                Html.input [Html.Attributes.attribute "class" "form-control form-control-lg", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "placeholder" "Enter a search string", Html.Events.onInput ( input )] []
                , Html.button [Html.Attributes.attribute "class" "btn btn-primary", ( submit )] [Html.text "Submit"
              ]]
            ]
          ]
        ]
      ]
    ]
