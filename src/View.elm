module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Items.Edit
import Items.List
import Items.Models exposing (ItemId)
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        ItemsRoute ->
            Html.map ItemsMsg (Items.List.view model.items)

        ItemRoute id ->
            itemEditPage model id

        NotFoundRoute ->
            notFoundView


itemEditPage : Model -> ItemId -> Html Msg
itemEditPage model itemId =
    let
        maybeItem =
            model.items
                |> List.filter (\item -> item.id == itemId)
                |> List.head
    in
        case maybeItem of
            Just item ->
                Html.map ItemsMsg (Items.Edit.view item)

            Nothing ->
                notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not Found"
        ]
