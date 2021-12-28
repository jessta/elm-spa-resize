module Shared exposing
    ( Flags
    , Model
    , Msg
    , init
    , subscriptions
    , update
    )

import Json.Decode as Json
import Request exposing (Request)
import Time
import Browser.Events
import Json.Decode

type alias Flags =
    Json.Value


type alias Model =
    {height: Int, width: Int}


type Msg
    = NoOp | Resize Int Int

flagsDecoder: Json.Decode.Decoder Model
flagsDecoder = Json.map2 Model (Json.Decode.field "height" Json.int) (Json.Decode.field "width" Json.int)

init : Request -> Flags -> ( Model, Cmd Msg )
init _ flags =
    ( case Json.decodeValue flagsDecoder flags of
        Err a ->
            { height = 0, width = 0 }

        Ok a ->
            a
    , Cmd.none
    )


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        Resize width height -> ({model | height = height, width = width}, Cmd.none)
        NoOp ->
            ( model, Cmd.none )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ = Browser.Events.onResize Resize
