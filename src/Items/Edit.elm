module Items.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Html.Events exposing (onClick)
import Items.Messages exposing (..)
import Items.Models exposing (..)


view : Item -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Item -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listBtn ]


form : Item -> Html Msg
form item =
    div [ class "m3" ]
        [ h1 [] [ text item.name ]
        , formQuantity item
        ]


formQuantity : Item -> Html Msg
formQuantity item =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Quantity" ]
        , div [ class "col col-7" ]
            [ btnQuantityDecrease item
            , span [ class "h2 bold" ] [ text (toString item.quantity) ]
            , btnQuantityIncrease item
            ]
        ]


btnQuantityDecrease : Item -> Html Msg
btnQuantityDecrease item =
    a [ class "btn ml1 h1", onClick (ChangeQuantity item.id -1) ]
        [ i [ class "fa fa-minus-circle" ] [] ]


btnQuantityIncrease : Item -> Html Msg
btnQuantityIncrease item =
    a [ class "btn ml1 h1", onClick (ChangeQuantity item.id 1) ]
        [ i [ class "fa fa-plus-circle" ] [] ]


listBtn : Html Msg
listBtn =
    button
        [ class "btn regular"
        , onClick ShowItems
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]
