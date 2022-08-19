defmodule Protocol.InventoryItems do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :type, 1, type: :int32
  field :items, 2, repeated: true, type: :bytes
end
