module SopostPeople exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)
import Json.Decode as Decode
import Json.Encode as Encode
import Task
import Http

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = \_-> Sub.none
    }

-- MODEL
type alias Model =
  { name : String
  , title: String
  , locations : String
  , avatar : String
  , flash : String
  }

init : (Model, Cmd Msg)
init =
  (Model "" "" "" "" "", Cmd.none)

type Msg
    = Name String
    | Title String
    | Locations String
    | Avatar String
    | SendPerson (Result Http.Error Person)
    | Submit


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case Debug.log "update" msg of
    Name name ->
      { model | name = name }
        ! []
    Title title ->
      { model | title = title }
        ! []
    Locations locations ->
      { model | locations = locations }
        ! []
    Avatar url ->
      { model | avatar = url }
        ! []
    SendPerson (Ok person) ->
      { model | flash = person.name ++ " Created!" } ! []
    SendPerson (Err _) ->
      model ! []
    Submit ->
      let
        person = Person model.name model.title model.locations model.avatar
      in
        model ! [ send person ]

showFlash : String -> Html Msg
showFlash message =
  case String.isEmpty message of
    True ->
      span [] [ text "" ]
    False ->
      span [] [ text message ]

-- VIEW
view : Model -> Html Msg
view model =
  div []
  [ div [] [ showFlash model.flash ]
  , Html.form [ onSubmit Submit ]
      [ div []
          [ label [] [ text "Name" ]
          , input [ type_ "text", placeholder "Name", onInput Name ] []
          ]
      , div []
          [ label [] [ text "Title" ]
          , input [ type_ "text", placeholder "Title", onInput Title ] []
          ]
      , div []
          [ label [] [ text "Locations" ]
          , input [ type_ "text", placeholder "Locations", onInput Locations ] []
          ]
      , div []
          [ label [] [ text "Avatar" ]
          , input [ type_ "text", placeholder "Avatar", onInput Avatar ] []
          ]
      , button [ type_ "submit" ] [ text "Submit" ]
      ]
  ]

type alias Person =
  { name : String
  , title : String
  , locations : String
  , avatar : String
  }

decoder : Decode.Decoder Person
decoder =
  Decode.map4 Person
    (Decode.at ["name"] Decode.string)
    (Decode.at ["title"] Decode.string)
    (Decode.at ["locations"] Decode.string)
    (Decode.at ["avatar"] Decode.string)

encoder : Person -> Encode.Value
encoder person =
  Encode.object
      [ ("name", Encode.string person.name)
      , ("title", Encode.string person.title)
      , ("locations", Encode.string person.locations)
      , ("avatar", Encode.string person.avatar)
      ]

createUrl : String
createUrl =
    "/api/people"

send : Person -> Cmd Msg
send person =
  Http.send SendPerson (Http.post createUrl (Http.jsonBody (encoder person)) decoder)
