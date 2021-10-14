defmodule Protocol.AuthenticationPath do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: [boolean]
        }

  defstruct [:value]

  field :value, 1, repeated: true, type: :bool
end

defmodule Protocol.MerklePath do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          authentication_paths: [Protocol.AuthenticationPath.t()],
          index: [boolean],
          rt: binary
        }

  defstruct [:authentication_paths, :index, :rt]

  field :authentication_paths, 1, repeated: true, type: Protocol.AuthenticationPath
  field :index, 2, repeated: true, type: :bool
  field :rt, 3, type: :bytes
end

defmodule Protocol.OutputPoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: binary,
          index: integer
        }

  defstruct [:hash, :index]

  field :hash, 1, type: :bytes
  field :index, 2, type: :int32
end

defmodule Protocol.OutputPointInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          out_points: [Protocol.OutputPoint.t()],
          block_num: integer
        }

  defstruct [:out_points, :block_num]

  field :out_points, 1, repeated: true, type: Protocol.OutputPoint
  field :block_num, 2, type: :int32
end

defmodule Protocol.PedersenHash do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          content: binary
        }

  defstruct [:content]

  field :content, 1, type: :bytes
end

defmodule Protocol.IncrementalMerkleTree do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          left: Protocol.PedersenHash.t() | nil,
          right: Protocol.PedersenHash.t() | nil,
          parents: [Protocol.PedersenHash.t()]
        }

  defstruct [:left, :right, :parents]

  field :left, 1, type: Protocol.PedersenHash
  field :right, 2, type: Protocol.PedersenHash
  field :parents, 3, repeated: true, type: Protocol.PedersenHash
end

defmodule Protocol.IncrementalMerkleVoucher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tree: Protocol.IncrementalMerkleTree.t() | nil,
          filled: [Protocol.PedersenHash.t()],
          cursor: Protocol.IncrementalMerkleTree.t() | nil,
          cursor_depth: integer,
          rt: binary,
          output_point: Protocol.OutputPoint.t() | nil
        }

  defstruct [:tree, :filled, :cursor, :cursor_depth, :rt, :output_point]

  field :tree, 1, type: Protocol.IncrementalMerkleTree
  field :filled, 2, repeated: true, type: Protocol.PedersenHash
  field :cursor, 3, type: Protocol.IncrementalMerkleTree
  field :cursor_depth, 4, type: :int64
  field :rt, 5, type: :bytes
  field :output_point, 10, type: Protocol.OutputPoint
end

defmodule Protocol.IncrementalMerkleVoucherInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          vouchers: [Protocol.IncrementalMerkleVoucher.t()],
          paths: [binary]
        }

  defstruct [:vouchers, :paths]

  field :vouchers, 1, repeated: true, type: Protocol.IncrementalMerkleVoucher
  field :paths, 2, repeated: true, type: :bytes
end

defmodule Protocol.SpendDescription do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value_commitment: binary,
          anchor: binary,
          nullifier: binary,
          rk: binary,
          zkproof: binary,
          spend_authority_signature: binary
        }

  defstruct [:value_commitment, :anchor, :nullifier, :rk, :zkproof, :spend_authority_signature]

  field :value_commitment, 1, type: :bytes
  field :anchor, 2, type: :bytes
  field :nullifier, 3, type: :bytes
  field :rk, 4, type: :bytes
  field :zkproof, 5, type: :bytes
  field :spend_authority_signature, 6, type: :bytes
end

defmodule Protocol.ReceiveDescription do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value_commitment: binary,
          note_commitment: binary,
          epk: binary,
          c_enc: binary,
          c_out: binary,
          zkproof: binary
        }

  defstruct [:value_commitment, :note_commitment, :epk, :c_enc, :c_out, :zkproof]

  field :value_commitment, 1, type: :bytes
  field :note_commitment, 2, type: :bytes
  field :epk, 3, type: :bytes
  field :c_enc, 4, type: :bytes
  field :c_out, 5, type: :bytes
  field :zkproof, 6, type: :bytes
end

defmodule Protocol.ShieldedTransferContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transparent_from_address: binary,
          from_amount: integer,
          spend_description: [Protocol.SpendDescription.t()],
          receive_description: [Protocol.ReceiveDescription.t()],
          binding_signature: binary,
          transparent_to_address: binary,
          to_amount: integer
        }

  defstruct [
    :transparent_from_address,
    :from_amount,
    :spend_description,
    :receive_description,
    :binding_signature,
    :transparent_to_address,
    :to_amount
  ]

  field :transparent_from_address, 1, type: :bytes
  field :from_amount, 2, type: :int64
  field :spend_description, 3, repeated: true, type: Protocol.SpendDescription
  field :receive_description, 4, repeated: true, type: Protocol.ReceiveDescription
  field :binding_signature, 5, type: :bytes
  field :transparent_to_address, 6, type: :bytes
  field :to_amount, 7, type: :int64
end
