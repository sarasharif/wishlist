module Items.Messages exposing (..)

import Http
import Items.Models exposing (ItemId, Item)


type Msg
    = OnFetchAll (Result Http.Error (List Item))
    | ShowItems
    | ShowItem ItemId
