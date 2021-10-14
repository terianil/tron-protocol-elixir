defmodule Protocol.WitnessCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          url: binary
        }

  defstruct [:owner_address, :url]

  field :owner_address, 1, type: :bytes
  field :url, 2, type: :bytes
end

defmodule Protocol.WitnessUpdateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          update_url: binary
        }

  defstruct [:owner_address, :update_url]

  field :owner_address, 1, type: :bytes
  field :update_url, 12, type: :bytes
end

defmodule Protocol.VoteWitnessContract.Vote do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          vote_address: binary,
          vote_count: integer
        }

  defstruct [:vote_address, :vote_count]

  field :vote_address, 1, type: :bytes
  field :vote_count, 2, type: :int64
end

defmodule Protocol.VoteWitnessContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          votes: [Protocol.VoteWitnessContract.Vote.t()],
          support: boolean
        }

  defstruct [:owner_address, :votes, :support]

  field :owner_address, 1, type: :bytes
  field :votes, 2, repeated: true, type: Protocol.VoteWitnessContract.Vote
  field :support, 3, type: :bool
end
