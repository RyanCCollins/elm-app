
-- -*- mode: elm; coding: utf-8 -*- --
module View exposing (view)

import AppModel exposing (Model, Msg(..))

import Html exposing (Html)
import Html.Attributes
import Html.Events exposing (onClick)

view : Model -> Html Msg
view model =
  let
    url = model.url
    input = Input
    submit = Submit
  in
    Html.div [Html.Attributes.attribute "class" "container centered full-height"] [
      Html.div [Html.Attributes.attribute "class" "row"] [
        Html.div [Html.Attributes.attribute "class" "col-xs-12"] [
          Html.div [Html.Attributes.attribute "class" "jumbotron"] [
            Html.h1 [Html.Attributes.attribute "class" "display-3 text-center pad-10 margin-20b"] [Html.text "Giphy Search"]
            , Html.form [Html.Attributes.attribute "class" "form-inline centered"] [
              Html.div [Html.Attributes.attribute "class" "form-group"] [
                Html.input [Html.Attributes.attribute "class" "form-control form-control-lg", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "placeholder" "Enter a search string", Html.Events.onInput ( input ), Html.Attributes.attribute "value" (model.input)] []
                , Html.button [Html.Attributes.attribute "type" "button", Html.Attributes.attribute "class" "btn btn-primary", Html.Events.onClick ( submit )] [Html.text "Submit"
              ]]
            ]
          ]
        ]
        , renderTitle model
        , Html.div [Html.Attributes.attribute "class" "col-xs-12 centered"] [
          Html.div [Html.Attributes.attribute "class" "loading-wrapper"] [
            loading model
          ]
        ]
        , Html.div [Html.Attributes.attribute "class" "col-xs-12 centered"] [
          Html.img [Html.Attributes.attribute "class" "img-responsive img-rounded", Html.Attributes.attribute "src" (url)] []
        ]
      ]
    ]

loading : Model -> Html Msg
loading model =
  case model.loading of
    True ->
      Html.div [Html.Attributes.attribute "class" "loading"] [
        Html.progress [Html.Attributes.attribute "class" "progress progress-striped progress-animated", Html.Attributes.attribute "value" "25", Html.Attributes.attribute "max" "100"] []
      ]
    False ->
      Html.div [] []

renderTitle : Model -> Html Msg
renderTitle model =
  case model.title of
    Just val ->
      Html.div [Html.Attributes.attribute "class" "col-xs-12 centered"] [
        Html.h2 [Html.Attributes.attribute "class" "display-3"] [Html.text val]
      ]
    Nothing ->
      Html.div [] []
