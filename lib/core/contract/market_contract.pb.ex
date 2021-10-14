defmodule Protocol.MarketSellAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          sell_token_id: binary,
          sell_token_quantity: integer,
          buy_token_id: binary,
          buy_token_quantity: integer
        }

  defstruct [
    :owner_address,
    :sell_token_id,
    :sell_token_quantity,
    :buy_token_id,
    :buy_token_quantity
  ]

  field :owner_address, 1, type: :bytes
  field :sell_token_id, 2, type: :bytes
  field :sell_token_quantity, 3, type: :int64
  field :buy_token_id, 4, type: :bytes
  field :buy_token_quantity, 5, type: :int64
end

defmodule Protocol.MarketCancelOrderContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          order_id: binary
        }

  defstruct [:owner_address, :order_id]

  field :owner_address, 1, type: :bytes
  field :order_id, 2, type: :bytes
end
