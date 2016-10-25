module Models exposing (..)

import Items.Models exposing (Item)


type alias Model =
    { items : List Item
    }


initialModel : Model
initialModel =
    { items = []
    }
