defmodule Protocol.ExchangeCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          first_token_id: binary,
          first_token_balance: integer,
          second_token_id: binary,
          second_token_balance: integer
        }

  defstruct [
    :owner_address,
    :first_token_id,
    :first_token_balance,
    :second_token_id,
    :second_token_balance
  ]

  field :owner_address, 1, type: :bytes
  field :first_token_id, 2, type: :bytes
  field :first_token_balance, 3, type: :int64
  field :second_token_id, 4, type: :bytes
  field :second_token_balance, 5, type: :int64
end

defmodule Protocol.ExchangeInjectContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          exchange_id: integer,
          token_id: binary,
          quant: integer
        }

  defstruct [:owner_address, :exchange_id, :token_id, :quant]

  field :owner_address, 1, type: :bytes
  field :exchange_id, 2, type: :int64
  field :token_id, 3, type: :bytes
  field :quant, 4, type: :int64
end

defmodule Protocol.ExchangeWithdrawContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          exchange_id: integer,
          token_id: binary,
          quant: integer
        }

  defstruct [:owner_address, :exchange_id, :token_id, :quant]

  field :owner_address, 1, type: :bytes
  field :exchange_id, 2, type: :int64
  field :token_id, 3, type: :bytes
  field :quant, 4, type: :int64
end

defmodule Protocol.ExchangeTransactionContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          exchange_id: integer,
          token_id: binary,
          quant: integer,
          expected: integer
        }

  defstruct [:owner_address, :exchange_id, :token_id, :quant, :expected]

  field :owner_address, 1, type: :bytes
  field :exchange_id, 2, type: :int64
  field :token_id, 3, type: :bytes
  field :quant, 4, type: :int64
  field :expected, 5, type: :int64
end
