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

type alias Flags =
    Json.Value


type alias Model =
    {height: Int, width: Int}


type Msg
    = NoOp | Resize Int Int


init : Request -> Flags -> ( Model, Cmd Msg )
init _ _ =
    ( {height= 0, width = 0}, Cmd.none )


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        Resize width height -> ({model | height = height, width = width}, Cmd.none)
        NoOp ->
            ( model, Cmd.none )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ = Browser.Events.onResize Resize
