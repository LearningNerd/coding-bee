module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Team =
    { player_1 : String
    , player_2 : String
    }


type alias Model =
    { teams : List Team
    }


init : Model
init =
    { teams = []
    }



-- UPDATE


type Msg
    = Add String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add str ->
            let
                test_team =
                    { player_1 = str
                    , player_2 = str
                    }
            in
            { model | teams = test_team :: model.teams }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Yo imma placehold this", onInput Add ] []
        ]



-- createTeam : String -> Team
-- createTeam str =
--     { player_1 = str
--     , player_2 = str
--     }
