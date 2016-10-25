module Messages exposing (..)

import Navigation exposing (Location)
import Items.Messages


type Msg
    = ItemsMsg Items.Messages.Msg
    | OnLocationChange Location
