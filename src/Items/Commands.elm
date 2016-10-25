module Items.Commands exposing (..)

import Http
import Json.Encode as Encode
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


saveUrl : ItemId -> String
saveUrl itemId =
    "http://localhost:4000/items/" ++ itemId


saveRequest : Item -> Http.Request Item
saveRequest item =
    Http.request
        { body = memberEncoded item |> Http.jsonBody
        , expect = Http.expectJson memberDecoder
        , headers = []
        , method = "PATCH"
        , timeout = Nothing
        , url = saveUrl item.id
        , withCredentials = False
        }


save : Item -> Cmd Msg
save item =
    saveRequest item
        |> Http.send OnSave


memberEncoded : Item -> Encode.Value
memberEncoded item =
    let
        list =
            [ ( "id", Encode.string item.id )
            , ( "name", Encode.string item.name )
            , ( "quantity", Encode.int item.quantity )
            ]
    in
        list
            |> Encode.object
