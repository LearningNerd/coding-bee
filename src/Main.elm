import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }


type alias Model =
  { content : String
  }

init : Model
init = 
  { content = "hiiii" }


-- UPDATE


type Msg 
  = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }


-- VIEW

view : Model -> Html Msg
view model =
  div [] 
    [ input [ placeholder model.content, onInput Change] []
    , div [] [text model.content]
    ]

