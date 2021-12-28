module Pages.Home_ exposing (page)

import Html
import View exposing (View)
import Page exposing (Page)
import Request exposing (Request)
import Shared


page : Shared.Model -> Request -> Page
page shared req =
    Page.static
        { view = view shared
        }

view : Shared.Model -> View msg
view shared =
    { title = "Homepage"
    , body = [ Html.text <| "width: " ++ (String.fromInt shared.width) ++ " height: " ++ (String.fromInt shared.height) ]
    }
