module Main exposing (..)
import Dom
import Html exposing (..)
import Html.App as App exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Keyed as Keyed
import Html.Lazy exposing (lazy, lazy2)
import Json.Decode as Json
import String
import Task

type alias Model = 
  { todos: List Todo
  , field: String
  , uid: Int
  , visibility: String
  }
  
type alias Todo = 
  { description: String
  , completed: Bool
  , editing: Bool
  , id: Int
  }

emptyModel : Model
emptyModel =
  {
    todos = [],
    visibility = "All",
    field = "",
    uid = 0
  }


newTodo : String -> Int -> Todo
newTodo description id =
  { description = description
  , completed = False
  , editing = False
  , id = id
  }

init : Maybe Model -> ( Model, Cmd Msg )
init savedModel =
  Maybe.withDefault emptyModel savedModel ! []

-- update

type Msg =
  NoOp
  | UpdateField String
  | EditingTodo Int Bool
  | UpdateTodo Int String
  | Add
  | Delete Int
  | DeleteComplete
  | Check Int Bool
  | CheckAll Bool
  | ChangeVisibility String
  
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      model ! []
      
    Add ->
      { model
      | uid = model.uid + 1
      , field = ""
      , todos = 
        if String.isEmpty model.field then
          model.todos
        else
          model.todos ++ [ newTodo model.field, model.uid ]
        
      }
        ! []

    UpdateField str ->
      { model | field = str }
        ! []
  
    EditingTodo id isEditing ->
      let
        updateTodo t =
          if t.id == id then
            { t | editing isEditing }
          else
            t
          
        focus =
          Dom.focus ("todo-" ++ toString id)
      in
        { model | todos = List.map updateTodo model.todos }
          ! [ Task.attempt (\_ -> NoOp ) focus ]
        
    UpdateTodo id task ->
      let
        updateTodo t =
          if t.id == id then
            { t | description = task }
          else
            t
    
      in
        { model | todos = List.map updateTodo model.todos }
          ! []
        
    Delete id ->
      { model | todos = List.filter (\t -> t.id /= id) model.todos }
        ! []
      
    DeleteComplete ->
      { model | todos = List.filter (not << .completed) model.todos }
        ! []
    
    Check id isCompleted ->
      let
        updateTodo t =
          if t.id == id then
            { t | completed = isCompleted }
          else
            t
      in
        { model | todos = List.map updateTodo model.todos }
          ! []
  
  
    
      
-- view
