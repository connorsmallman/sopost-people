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
  , avatarUrl : String
  }

init : (Model, Cmd Msg)
init =
  (Model "" "" "" "", Cmd.none)

type Msg
    = Name String
    | Title String
    | Locations String
    | AvatarUrl String
    | SendPerson (Result Http.Error Model)
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
    AvatarUrl url ->
      { model | avatarUrl = url }
        ! []
    SendPerson (Ok person) ->
      model ! []
    SendPerson (Err _) ->
      model ! []
    Submit ->
      model ! [ send model ]

-- VIEW
view : Model -> Html Msg
view model =
  Html.form [ onSubmit Submit ]
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "text", placeholder "Title", onInput Title ] []
    , input [ type_ "text", placeholder "Locations", onInput Locations ] []
    , input [ type_ "text", placeholder "Avatar", onInput AvatarUrl ] []
    , button [ type_ "submit" ] [ text "Submit" ]
    ]

decoder : Decode.Decoder Model
decoder =
  Decode.map4 Model
    (Decode.at ["name"] Decode.string)
    (Decode.at ["title"] Decode.string)
    (Decode.at ["locations"] Decode.string)
    (Decode.at ["avatar"] Decode.string)

encoder : Model -> Encode.Value
encoder model =
  Encode.object
      [ ("name", Encode.string model.name)
      , ("title", Encode.string model.title)
      , ("locations", Encode.string model.locations)
      , ("avatarUrl", Encode.string model.avatarUrl)
      ]

createUrl : String
createUrl =
    "/api/people"

send : Model -> Cmd Msg
send model =
  Http.send SendPerson (Http.post createUrl (Http.jsonBody (encoder model)) decoder)
