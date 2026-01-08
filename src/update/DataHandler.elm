module DataHandler exposing (getBlueLionsTeam, initBuild, initStaticData, initTeam, mockBuilds)

import Character exposing (initCharacters)
import CustomTypes exposing (Build, SkillType(..))
import Dict exposing (Dict)
import GlobalModel exposing (DataModel)
import Job exposing (initJobs)
import JobCategory exposing (initJobCategories)
import JobSkill exposing (initJobSkills)
import MasterySkill exposing (initMasterySkills)
import StandardSkill exposing (initStandardSkills)
import Study exposing (initStudies)


initStaticData : DataModel
initStaticData =
    DataModel initStudies initJobCategories initJobs initJobSkills initMasterySkills initStandardSkills initCharacters


initTeam : Dict Int Build
initTeam =
    Dict.fromList
        [ ( 0, initBuild 0 ) ]


initBuild : Int -> Build
initBuild idCharacter =
    Build idCharacter [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 255 True


mockBuilds : Dict Int Build
mockBuilds =
    Dict.fromList
        [ ( 0, Build 0 [ ( 0, 13, MasteryType ), ( 1, 14, MasteryType ), ( 2, 20, MasteryType ), ( 3, 17, StandardType ), ( 4, 0, NoType ) ] [ ( 0, 12, StandardType ), ( 1, 13, StandardType ), ( 2, 0, NoType ) ] 255 False )
        , ( 1, Build 1 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 255 True )
        , ( 2, Build 2 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 42 True )
        , ( 3, Build 10 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 3 True )
        , ( 4, Build 18 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 5 True )
        , ( 5, Build 3 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 28 True )
        , ( 6, Build 11 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 9 True )
        , ( 7, Build 19 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 3 True )
        , ( 8, Build 4 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 15 True )
        , ( 10, Build 20 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 2 True )
        , ( 11, Build 34 [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 0, NoType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 30 True )
        , ( 9, Build 22 [ ( 0, 1, MasteryType ), ( 1, 2, StandardType ), ( 2, 25, MasteryType ), ( 3, 0, NoType ), ( 4, 0, NoType ) ] [ ( 0, 13, StandardType ), ( 1, 0, NoType ), ( 2, 0, NoType ) ] 5 True )
        ]


getBlueLionsTeam : Dict Int Build
getBlueLionsTeam =
    let
        -- IDs based on Character.elm
        -- 1: Byleth (F)
        -- 10: Dimitri
        -- 11: Dedue
        -- 12: Felix
        -- 15: Mercedes
        -- 13: Ashe
        -- 16: Annette
        -- 14: Sylvain
        -- 17: Ingrid
        characterIds =
            [ 1, 10, 11, 12, 15, 13, 16, 14, 17 ]
    in
    characterIds
        |> List.indexedMap (\idx charId -> ( idx, initBuild charId ))
        |> Dict.fromList
