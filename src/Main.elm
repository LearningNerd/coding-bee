module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Team =
    { teamName : String
    , players : List String
    }


type alias Model =
    { teams : List Team
    , formDataTeamName : String
    }


init : Model
init =
    { teams =
        [ Team "Evil Little Monsters" [ "Sebastian", "Vance" ]
        , Team "Jumping Sloths" [ "Manny", "Terry" ]
        ]
    , formDataTeamName = ""
    }



-- UPDATE


type Msg
    = AddTeam
    | InputTeamName String


update : Msg -> Model -> Model
update msg model =
    case msg of
        --TODO: don't let teams have the same name
        InputTeamName teamName -> 
            { model | formDataTeamName = teamName}
        AddTeam ->
            { model | teams = Team model.formDataTeamName [] :: model.teams }
        


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Team name", onInput InputTeamName ]
            []
        , button [ onClick AddTeam ] [ text "Add team" ]
        , displayTeams model
        ]


displayTeams : Model -> Html msg
displayTeams model =
    ul [] (List.map (\team -> li [] [ text team.teamName ]) model.teams)



-- List.map () model.teams
-- createTeam : String -> Team
-- createTeam str =
--     { player_1 = str
--     , player_2 = str
--     }
