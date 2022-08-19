defmodule Protocol.ResourceCode do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :BANDWIDTH, 0
  field :ENERGY, 1
  field :TRON_POWER, 2
end
