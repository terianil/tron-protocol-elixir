defmodule Protocol.ProposalApproveContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          proposal_id: integer,
          is_add_approval: boolean
        }

  defstruct [:owner_address, :proposal_id, :is_add_approval]

  field :owner_address, 1, type: :bytes
  field :proposal_id, 2, type: :int64
  field :is_add_approval, 3, type: :bool
end

defmodule Protocol.ProposalCreateContract.ParametersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: integer,
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :int64
  field :value, 2, type: :int64
end

defmodule Protocol.ProposalCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          parameters: %{integer => integer}
        }

  defstruct [:owner_address, :parameters]

  field :owner_address, 1, type: :bytes

  field :parameters, 2,
    repeated: true,
    type: Protocol.ProposalCreateContract.ParametersEntry,
    map: true
end

defmodule Protocol.ProposalDeleteContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          proposal_id: integer
        }

  defstruct [:owner_address, :proposal_id]

  field :owner_address, 1, type: :bytes
  field :proposal_id, 2, type: :int64
end
