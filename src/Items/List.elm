module Items.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Items.Messages exposing (..)
import Items.Models exposing (Item)


view : List Item -> Html Msg
view items =
    div []
        [ nav items
        , list items
        ]


nav : List Item -> Html Msg
nav items =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Items" ] ]


list : List Item -> Html Msg
list items =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Quantity" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map itemRow items)
            ]
        ]


itemRow : Item -> Html Msg
itemRow item =
    tr []
        [ td [] [ text item.id ]
        , td [] [ text item.name ]
        , td [] [ text (toString item.quantity) ]
        , td []
            [ editBtn item ]
        ]


editBtn : Item -> Html Msg
editBtn item =
    button
        [ class "btn regular"
        , onClick (ShowItem item.id)
        ]
        [ i [ class "fa fa-pencil mr1" ] [] ]
