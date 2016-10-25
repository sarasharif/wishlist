module Items.Models exposing (..)


type alias ItemId =
    String


type alias Item =
    { id : ItemId
    , name : String
    , quantity : Int
    }


new : Item
new =
    { id = "0"
    , name = ""
    , quantity = 1
    }
