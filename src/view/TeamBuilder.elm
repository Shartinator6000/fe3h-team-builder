module TeamBuilder exposing (viewBuilder)

import BuildInfoView exposing (sectionBuildInfo)
import BuildView exposing (controlPanel, viewBuild)
import CharacterModal exposing (modalCharacterPicker)
import CustomTypes exposing (Build, House(..))
import Dict exposing (Dict(..))
import GlobalMessage exposing (BuildPanel(..), Msg(..))
import GlobalModel exposing (Model)
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import JobModal exposing (modalJobPicker)
import SkillModal exposing (modalSkillPicker)


viewBuilder : Model -> Html Msg
viewBuilder model =
    div []
        [ h3 [ class "text-light" ] [ text "Fire Emblem Three Houses - Team Builder!" ]
        , viewTabs model
        , viewTeam model
        , modalCharacterPicker model
        , modalSkillPicker model
        , modalJobPicker model
        ]

viewTabs : Model -> Html Msg
viewTabs model =
    div [ class "house-tabs" ]
        [ viewTab model BlackEagles "Black Eagles"
        , viewTab model BlueLions "Blue Lions"
        , viewTab model GoldenDeer "Golden Deer"
        ]


viewTab : Model -> House -> String -> Html Msg
viewTab model house title =
    let
        activeClass =
            if model.view.selectedHouse == house then
                " active"

            else
                ""
        
        icon =
            if house == BlueLions then
                 [ Html.img [ Html.Attributes.src "resources/img/houses/blue_lions.png", class "tab-icon", Html.Attributes.alt "Blue Lions" ] [] ]
            else
                []
    in
    div
        [ class ("house-tab" ++ activeClass)
        , onClick (SwitchHouse house)
        ]
        (icon ++ [ text title ])


viewTeam : Model -> Html Msg
viewTeam model =
    let
        addBuildButton =
            if Dict.size model.team < 12 then
                div [ class "add-build", onClick (BuildMsg AddBuild) ] []

            else
                div [] []
    in
    div [ class "c-table" ]
        ((model.team
            |> Dict.toList
            |> List.sortWith (\t1 t2 -> compare (Tuple.first t1) (Tuple.first t2))
            |> List.map (\e -> viewRow model e)
         )
            ++ [ addBuildButton ]
        )


viewRow : Model -> ( Int, Build ) -> Html Msg
viewRow model ( idx, build ) =
    div [ class "c-container" ]
        [ viewBuild ( idx, build )
        , sectionBuildInfo build
        , controlPanel model idx
        ]
