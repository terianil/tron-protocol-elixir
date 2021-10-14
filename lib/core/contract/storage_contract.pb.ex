defmodule Protocol.BuyStorageBytesContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          bytes: integer
        }

  defstruct [:owner_address, :bytes]

  field :owner_address, 1, type: :bytes
  field :bytes, 2, type: :int64
end

defmodule Protocol.BuyStorageContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          quant: integer
        }

  defstruct [:owner_address, :quant]

  field :owner_address, 1, type: :bytes
  field :quant, 2, type: :int64
end

defmodule Protocol.SellStorageContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          storage_bytes: integer
        }

  defstruct [:owner_address, :storage_bytes]

  field :owner_address, 1, type: :bytes
  field :storage_bytes, 2, type: :int64
end

defmodule Protocol.UpdateBrokerageContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          brokerage: integer
        }

  defstruct [:owner_address, :brokerage]

  field :owner_address, 1, type: :bytes
  field :brokerage, 2, type: :int32
end
