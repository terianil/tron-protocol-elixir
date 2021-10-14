defmodule Protocol.AccountCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          account_address: binary,
          type: Protocol.AccountType.t()
        }

  defstruct [:owner_address, :account_address, :type]

  field :owner_address, 1, type: :bytes
  field :account_address, 2, type: :bytes
  field :type, 3, type: Protocol.AccountType, enum: true
end

defmodule Protocol.AccountUpdateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_name: binary,
          owner_address: binary
        }

  defstruct [:account_name, :owner_address]

  field :account_name, 1, type: :bytes
  field :owner_address, 2, type: :bytes
end

defmodule Protocol.SetAccountIdContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_id: binary,
          owner_address: binary
        }

  defstruct [:account_id, :owner_address]

  field :account_id, 1, type: :bytes
  field :owner_address, 2, type: :bytes
end

defmodule Protocol.AccountPermissionUpdateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          owner: Protocol.Permission.t() | nil,
          witness: Protocol.Permission.t() | nil,
          actives: [Protocol.Permission.t()]
        }

  defstruct [:owner_address, :owner, :witness, :actives]

  field :owner_address, 1, type: :bytes
  field :owner, 2, type: Protocol.Permission
  field :witness, 3, type: Protocol.Permission
  field :actives, 4, repeated: true, type: Protocol.Permission
end
