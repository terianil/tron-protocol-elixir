defmodule Protocol.ResourceCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :BANDWIDTH | :ENERGY | :TRON_POWER

  field :BANDWIDTH, 0

  field :ENERGY, 1

  field :TRON_POWER, 2
end
