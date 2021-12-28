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
    {}


type Msg
    = NoOp | Tick Time.Posix | Resize Int Int


init : Request -> Flags -> ( Model, Cmd Msg )
init _ _ =
    ( {}, Cmd.none )


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        Tick t -> Debug.log "pizza" (model, Cmd.none)
        Resize x y -> Debug.log "resize" (model, Cmd.none)
        NoOp ->
            ( model, Cmd.none )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ = Browser.Events.onResize Resize
