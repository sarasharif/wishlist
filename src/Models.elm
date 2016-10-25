module Models exposing (..)

import Items.Models exposing (Item)
import Routing


type alias Model =
    { items : List Item
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { items = []
    , route = route
    }
