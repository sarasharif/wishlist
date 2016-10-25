module Items.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Items.Models exposing (ItemId, Item)
import Items.Messages exposing (..)


fetchAll : Cmd Msg
fetchAll =
    Http.get fetchAllUrl collectionDecoder
        |> Http.send OnFetchAll


fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/items"


collectionDecoder : Decode.Decoder (List Item)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Item
memberDecoder =
    Decode.map3 Item
        (field "id" Decode.string)
        (field "name" Decode.string)
        (field "quantity" Decode.int)
