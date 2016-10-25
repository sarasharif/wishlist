module Items.Update exposing (..)

import Items.Messages exposing (Msg(..))
import Items.Models exposing (Item)


update : Msg -> List Item -> ( List Item, Cmd Msg )
update message items =
    case message of
        OnFetchAll (Ok newItems) ->
            ( newItems, Cmd.none )

        OnFetchAll (Err error) ->
            ( items, Cmd.none )
