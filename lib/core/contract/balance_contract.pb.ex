defmodule Protocol.FreezeBalanceContract do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :owner_address, 1, type: :bytes, json_name: "ownerAddress"
  field :frozen_balance, 2, type: :int64, json_name: "frozenBalance"
  field :frozen_duration, 3, type: :int64, json_name: "frozenDuration"
  field :resource, 10, type: Protocol.ResourceCode, enum: true
  field :receiver_address, 15, type: :bytes, json_name: "receiverAddress"
end
defmodule Protocol.UnfreezeBalanceContract do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :owner_address, 1, type: :bytes, json_name: "ownerAddress"
  field :resource, 10, type: Protocol.ResourceCode, enum: true
  field :receiver_address, 15, type: :bytes, json_name: "receiverAddress"
end
defmodule Protocol.WithdrawBalanceContract do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :owner_address, 1, type: :bytes, json_name: "ownerAddress"
end
defmodule Protocol.TransferContract do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :owner_address, 1, type: :bytes, json_name: "ownerAddress"
  field :to_address, 2, type: :bytes, json_name: "toAddress"
  field :amount, 3, type: :int64
end
defmodule Protocol.TransactionBalanceTrace.Operation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :operation_identifier, 1, type: :int64, json_name: "operationIdentifier"
  field :address, 2, type: :bytes
  field :amount, 3, type: :int64
end
defmodule Protocol.TransactionBalanceTrace do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :transaction_identifier, 1, type: :bytes, json_name: "transactionIdentifier"
  field :operation, 2, repeated: true, type: Protocol.TransactionBalanceTrace.Operation
  field :type, 3, type: :string
  field :status, 4, type: :string
end
defmodule Protocol.BlockBalanceTrace.BlockIdentifier do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :hash, 1, type: :bytes
  field :number, 2, type: :int64
end
defmodule Protocol.BlockBalanceTrace do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :block_identifier, 1,
    type: Protocol.BlockBalanceTrace.BlockIdentifier,
    json_name: "blockIdentifier"

  field :timestamp, 2, type: :int64

  field :transaction_balance_trace, 3,
    repeated: true,
    type: Protocol.TransactionBalanceTrace,
    json_name: "transactionBalanceTrace"
end
defmodule Protocol.AccountTrace do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :balance, 1, type: :int64
  field :placeholder, 99, type: :int64
end
defmodule Protocol.AccountIdentifier do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :address, 1, type: :bytes
end
defmodule Protocol.AccountBalanceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :account_identifier, 1, type: Protocol.AccountIdentifier, json_name: "accountIdentifier"

  field :block_identifier, 2,
    type: Protocol.BlockBalanceTrace.BlockIdentifier,
    json_name: "blockIdentifier"
end
defmodule Protocol.AccountBalanceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :balance, 1, type: :int64

  field :block_identifier, 2,
    type: Protocol.BlockBalanceTrace.BlockIdentifier,
    json_name: "blockIdentifier"
end
