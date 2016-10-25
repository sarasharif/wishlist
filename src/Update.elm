module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Items.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ItemsMsg subMsg ->
            let
                ( updatedItems, cmd ) =
                    Items.Update.update subMsg model.items
            in
                ( { model | items = updatedItems }, Cmd.map ItemsMsg cmd )
