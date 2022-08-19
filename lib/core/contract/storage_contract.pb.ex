defmodule Protocol.BuyStorageBytesContract do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :owner_address, 1, type: :bytes, json_name: "ownerAddress"
  field :bytes, 2, type: :int64
end
defmodule Protocol.BuyStorageContract do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :owner_address, 1, type: :bytes, json_name: "ownerAddress"
  field :quant, 2, type: :int64
end
defmodule Protocol.SellStorageContract do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :owner_address, 1, type: :bytes, json_name: "ownerAddress"
  field :storage_bytes, 2, type: :int64, json_name: "storageBytes"
end
defmodule Protocol.UpdateBrokerageContract do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :owner_address, 1, type: :bytes, json_name: "ownerAddress"
  field :brokerage, 2, type: :int32
end
