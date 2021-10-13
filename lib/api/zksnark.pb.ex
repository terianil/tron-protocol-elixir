defmodule Protocol.ZksnarkResponse.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :SUCCESS | :FAILED

  field :SUCCESS, 0

  field :FAILED, 1
end

defmodule Protocol.ZksnarkRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Protocol.Transaction.t() | nil,
          sighash: binary,
          valueBalance: integer,
          txId: String.t()
        }

  defstruct [:transaction, :sighash, :valueBalance, :txId]

  field :transaction, 1, type: Protocol.Transaction
  field :sighash, 2, type: :bytes
  field :valueBalance, 3, type: :int64
  field :txId, 4, type: :string
end

defmodule Protocol.ZksnarkResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          code: Protocol.ZksnarkResponse.Code.t()
        }

  defstruct [:code]

  field :code, 1, type: Protocol.ZksnarkResponse.Code, enum: true
end

defmodule Protocol.TronZksnark.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.TronZksnark"

  rpc :CheckZksnarkProof, Protocol.ZksnarkRequest, Protocol.ZksnarkResponse
end

defmodule Protocol.TronZksnark.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.TronZksnark.Service
end
