defmodule Protocol.FreezeBalanceContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          frozen_balance: integer,
          frozen_duration: integer,
          resource: Protocol.ResourceCode.t(),
          receiver_address: binary
        }

  defstruct [:owner_address, :frozen_balance, :frozen_duration, :resource, :receiver_address]

  field :owner_address, 1, type: :bytes
  field :frozen_balance, 2, type: :int64
  field :frozen_duration, 3, type: :int64
  field :resource, 10, type: Protocol.ResourceCode, enum: true
  field :receiver_address, 15, type: :bytes
end

defmodule Protocol.UnfreezeBalanceContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          resource: Protocol.ResourceCode.t(),
          receiver_address: binary
        }

  defstruct [:owner_address, :resource, :receiver_address]

  field :owner_address, 1, type: :bytes
  field :resource, 10, type: Protocol.ResourceCode, enum: true
  field :receiver_address, 15, type: :bytes
end

defmodule Protocol.WithdrawBalanceContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary
        }

  defstruct [:owner_address]

  field :owner_address, 1, type: :bytes
end

defmodule Protocol.TransferContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          to_address: binary,
          amount: integer
        }

  defstruct [:owner_address, :to_address, :amount]

  field :owner_address, 1, type: :bytes
  field :to_address, 2, type: :bytes
  field :amount, 3, type: :int64
end

defmodule Protocol.TransactionBalanceTrace.Operation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          operation_identifier: integer,
          address: binary,
          amount: integer
        }

  defstruct [:operation_identifier, :address, :amount]

  field :operation_identifier, 1, type: :int64
  field :address, 2, type: :bytes
  field :amount, 3, type: :int64
end

defmodule Protocol.TransactionBalanceTrace do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction_identifier: binary,
          operation: [Protocol.TransactionBalanceTrace.Operation.t()],
          type: String.t(),
          status: String.t()
        }

  defstruct [:transaction_identifier, :operation, :type, :status]

  field :transaction_identifier, 1, type: :bytes
  field :operation, 2, repeated: true, type: Protocol.TransactionBalanceTrace.Operation
  field :type, 3, type: :string
  field :status, 4, type: :string
end

defmodule Protocol.BlockBalanceTrace.BlockIdentifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: binary,
          number: integer
        }

  defstruct [:hash, :number]

  field :hash, 1, type: :bytes
  field :number, 2, type: :int64
end

defmodule Protocol.BlockBalanceTrace do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block_identifier: Protocol.BlockBalanceTrace.BlockIdentifier.t() | nil,
          timestamp: integer,
          transaction_balance_trace: [Protocol.TransactionBalanceTrace.t()]
        }

  defstruct [:block_identifier, :timestamp, :transaction_balance_trace]

  field :block_identifier, 1, type: Protocol.BlockBalanceTrace.BlockIdentifier
  field :timestamp, 2, type: :int64
  field :transaction_balance_trace, 3, repeated: true, type: Protocol.TransactionBalanceTrace
end

defmodule Protocol.AccountTrace do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          balance: integer,
          placeholder: integer
        }

  defstruct [:balance, :placeholder]

  field :balance, 1, type: :int64
  field :placeholder, 99, type: :int64
end

defmodule Protocol.AccountIdentifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary
        }

  defstruct [:address]

  field :address, 1, type: :bytes
end

defmodule Protocol.AccountBalanceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_identifier: Protocol.AccountIdentifier.t() | nil,
          block_identifier: Protocol.BlockBalanceTrace.BlockIdentifier.t() | nil
        }

  defstruct [:account_identifier, :block_identifier]

  field :account_identifier, 1, type: Protocol.AccountIdentifier
  field :block_identifier, 2, type: Protocol.BlockBalanceTrace.BlockIdentifier
end

defmodule Protocol.AccountBalanceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          balance: integer,
          block_identifier: Protocol.BlockBalanceTrace.BlockIdentifier.t() | nil
        }

  defstruct [:balance, :block_identifier]

  field :balance, 1, type: :int64
  field :block_identifier, 2, type: Protocol.BlockBalanceTrace.BlockIdentifier
end
