module Routing exposing (..)

import Navigation exposing (Location)
import Items.Models exposing (ItemId)
import UrlParser exposing (..)


type Route
    = ItemsRoute
    | ItemRoute ItemId
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map ItemsRoute top
        , map ItemRoute (s "items" </> string)
        , map ItemsRoute (s "items")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
