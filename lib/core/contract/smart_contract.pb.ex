defmodule Protocol.SmartContract.ABI.Entry.EntryType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :UnknownEntryType
          | :Constructor
          | :Function
          | :Event
          | :Fallback
          | :Receive
          | :Error

  field :UnknownEntryType, 0

  field :Constructor, 1

  field :Function, 2

  field :Event, 3

  field :Fallback, 4

  field :Receive, 5

  field :Error, 6
end

defmodule Protocol.SmartContract.ABI.Entry.StateMutabilityType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :UnknownMutabilityType | :Pure | :View | :Nonpayable | :Payable

  field :UnknownMutabilityType, 0

  field :Pure, 1

  field :View, 2

  field :Nonpayable, 3

  field :Payable, 4
end

defmodule Protocol.SmartContract.ABI.Entry.Param do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          indexed: boolean,
          name: String.t(),
          type: String.t()
        }

  defstruct [:indexed, :name, :type]

  field :indexed, 1, type: :bool
  field :name, 2, type: :string
  field :type, 3, type: :string
end

defmodule Protocol.SmartContract.ABI.Entry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          anonymous: boolean,
          constant: boolean,
          name: String.t(),
          inputs: [Protocol.SmartContract.ABI.Entry.Param.t()],
          outputs: [Protocol.SmartContract.ABI.Entry.Param.t()],
          type: Protocol.SmartContract.ABI.Entry.EntryType.t(),
          payable: boolean,
          stateMutability: Protocol.SmartContract.ABI.Entry.StateMutabilityType.t()
        }

  defstruct [:anonymous, :constant, :name, :inputs, :outputs, :type, :payable, :stateMutability]

  field :anonymous, 1, type: :bool
  field :constant, 2, type: :bool
  field :name, 3, type: :string
  field :inputs, 4, repeated: true, type: Protocol.SmartContract.ABI.Entry.Param
  field :outputs, 5, repeated: true, type: Protocol.SmartContract.ABI.Entry.Param
  field :type, 6, type: Protocol.SmartContract.ABI.Entry.EntryType, enum: true
  field :payable, 7, type: :bool

  field :stateMutability, 8,
    type: Protocol.SmartContract.ABI.Entry.StateMutabilityType,
    enum: true
end

defmodule Protocol.SmartContract.ABI do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entrys: [Protocol.SmartContract.ABI.Entry.t()]
        }

  defstruct [:entrys]

  field :entrys, 1, repeated: true, type: Protocol.SmartContract.ABI.Entry
end

defmodule Protocol.SmartContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          origin_address: binary,
          contract_address: binary,
          abi: Protocol.SmartContract.ABI.t() | nil,
          bytecode: binary,
          call_value: integer,
          consume_user_resource_percent: integer,
          name: String.t(),
          origin_energy_limit: integer,
          code_hash: binary,
          trx_hash: binary
        }

  defstruct [
    :origin_address,
    :contract_address,
    :abi,
    :bytecode,
    :call_value,
    :consume_user_resource_percent,
    :name,
    :origin_energy_limit,
    :code_hash,
    :trx_hash
  ]

  field :origin_address, 1, type: :bytes
  field :contract_address, 2, type: :bytes
  field :abi, 3, type: Protocol.SmartContract.ABI
  field :bytecode, 4, type: :bytes
  field :call_value, 5, type: :int64
  field :consume_user_resource_percent, 6, type: :int64
  field :name, 7, type: :string
  field :origin_energy_limit, 8, type: :int64
  field :code_hash, 9, type: :bytes
  field :trx_hash, 10, type: :bytes
end

defmodule Protocol.CreateSmartContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          new_contract: Protocol.SmartContract.t() | nil,
          call_token_value: integer,
          token_id: integer
        }

  defstruct [:owner_address, :new_contract, :call_token_value, :token_id]

  field :owner_address, 1, type: :bytes
  field :new_contract, 2, type: Protocol.SmartContract
  field :call_token_value, 3, type: :int64
  field :token_id, 4, type: :int64
end

defmodule Protocol.TriggerSmartContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          contract_address: binary,
          call_value: integer,
          data: binary,
          call_token_value: integer,
          token_id: integer
        }

  defstruct [:owner_address, :contract_address, :call_value, :data, :call_token_value, :token_id]

  field :owner_address, 1, type: :bytes
  field :contract_address, 2, type: :bytes
  field :call_value, 3, type: :int64
  field :data, 4, type: :bytes
  field :call_token_value, 5, type: :int64
  field :token_id, 6, type: :int64
end

defmodule Protocol.ClearABIContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          contract_address: binary
        }

  defstruct [:owner_address, :contract_address]

  field :owner_address, 1, type: :bytes
  field :contract_address, 2, type: :bytes
end

defmodule Protocol.UpdateSettingContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          contract_address: binary,
          consume_user_resource_percent: integer
        }

  defstruct [:owner_address, :contract_address, :consume_user_resource_percent]

  field :owner_address, 1, type: :bytes
  field :contract_address, 2, type: :bytes
  field :consume_user_resource_percent, 3, type: :int64
end

defmodule Protocol.UpdateEnergyLimitContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          contract_address: binary,
          origin_energy_limit: integer
        }

  defstruct [:owner_address, :contract_address, :origin_energy_limit]

  field :owner_address, 1, type: :bytes
  field :contract_address, 2, type: :bytes
  field :origin_energy_limit, 3, type: :int64
end

defmodule Protocol.SmartContractDataWrapper do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          smart_contract: Protocol.SmartContract.t() | nil,
          runtimecode: binary
        }

  defstruct [:smart_contract, :runtimecode]

  field :smart_contract, 1, type: Protocol.SmartContract
  field :runtimecode, 2, type: :bytes
end
