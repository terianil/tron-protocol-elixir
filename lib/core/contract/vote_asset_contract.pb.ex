defmodule Protocol.VoteAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          vote_address: [binary],
          support: boolean,
          count: integer
        }

  defstruct [:owner_address, :vote_address, :support, :count]

  field :owner_address, 1, type: :bytes
  field :vote_address, 2, repeated: true, type: :bytes
  field :support, 3, type: :bool
  field :count, 5, type: :int32
end
