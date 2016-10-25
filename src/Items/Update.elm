module Items.Update exposing (..)

import Items.Messages exposing (Msg(..))
import Items.Models exposing (Item, ItemId)
import Items.Commands exposing (save)
import Navigation


update : Msg -> List Item -> ( List Item, Cmd Msg )
update message items =
    case message of
        OnFetchAll (Ok newItems) ->
            ( newItems, Cmd.none )

        OnFetchAll (Err error) ->
            ( items, Cmd.none )

        ShowItems ->
            ( items, Navigation.newUrl "#items" )

        ShowItem id ->
            ( items, Navigation.newUrl ("#items/" ++ id) )

        ChangeQuantity id howMuch ->
            ( items, changeQuantityCommands id howMuch items |> Cmd.batch )

        OnSave (Ok updatedItem) ->
            ( updateItem updatedItem items, Cmd.none )

        OnSave (Err error) ->
            ( items, Cmd.none )


changeQuantityCommands : ItemId -> Int -> List Item -> List (Cmd Msg)
changeQuantityCommands itemId howMuch items =
    let
        cmdForItem existingItem =
            if existingItem.id == itemId then
                save { existingItem | quantity = existingItem.quantity + howMuch }
            else
                Cmd.none
    in
        List.map cmdForItem items


updateItem : Item -> List Item -> List Item
updateItem updatedItem items =
    let
        select existingItem =
            if existingItem.id == updatedItem.id then
                updatedItem
            else
                existingItem
    in
        List.map select items
