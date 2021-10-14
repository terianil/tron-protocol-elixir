defmodule Protocol.AssetIssueContract.FrozenSupply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frozen_amount: integer,
          frozen_days: integer
        }

  defstruct [:frozen_amount, :frozen_days]

  field :frozen_amount, 1, type: :int64
  field :frozen_days, 2, type: :int64
end

defmodule Protocol.AssetIssueContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          owner_address: binary,
          name: binary,
          abbr: binary,
          total_supply: integer,
          frozen_supply: [Protocol.AssetIssueContract.FrozenSupply.t()],
          trx_num: integer,
          precision: integer,
          num: integer,
          start_time: integer,
          end_time: integer,
          order: integer,
          vote_score: integer,
          description: binary,
          url: binary,
          free_asset_net_limit: integer,
          public_free_asset_net_limit: integer,
          public_free_asset_net_usage: integer,
          public_latest_free_net_time: integer
        }

  defstruct [
    :id,
    :owner_address,
    :name,
    :abbr,
    :total_supply,
    :frozen_supply,
    :trx_num,
    :precision,
    :num,
    :start_time,
    :end_time,
    :order,
    :vote_score,
    :description,
    :url,
    :free_asset_net_limit,
    :public_free_asset_net_limit,
    :public_free_asset_net_usage,
    :public_latest_free_net_time
  ]

  field :id, 41, type: :string
  field :owner_address, 1, type: :bytes
  field :name, 2, type: :bytes
  field :abbr, 3, type: :bytes
  field :total_supply, 4, type: :int64
  field :frozen_supply, 5, repeated: true, type: Protocol.AssetIssueContract.FrozenSupply
  field :trx_num, 6, type: :int32
  field :precision, 7, type: :int32
  field :num, 8, type: :int32
  field :start_time, 9, type: :int64
  field :end_time, 10, type: :int64
  field :order, 11, type: :int64
  field :vote_score, 16, type: :int32
  field :description, 20, type: :bytes
  field :url, 21, type: :bytes
  field :free_asset_net_limit, 22, type: :int64
  field :public_free_asset_net_limit, 23, type: :int64
  field :public_free_asset_net_usage, 24, type: :int64
  field :public_latest_free_net_time, 25, type: :int64
end

defmodule Protocol.TransferAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          asset_name: binary,
          owner_address: binary,
          to_address: binary,
          amount: integer
        }

  defstruct [:asset_name, :owner_address, :to_address, :amount]

  field :asset_name, 1, type: :bytes
  field :owner_address, 2, type: :bytes
  field :to_address, 3, type: :bytes
  field :amount, 4, type: :int64
end

defmodule Protocol.UnfreezeAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary
        }

  defstruct [:owner_address]

  field :owner_address, 1, type: :bytes
end

defmodule Protocol.UpdateAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          description: binary,
          url: binary,
          new_limit: integer,
          new_public_limit: integer
        }

  defstruct [:owner_address, :description, :url, :new_limit, :new_public_limit]

  field :owner_address, 1, type: :bytes
  field :description, 2, type: :bytes
  field :url, 3, type: :bytes
  field :new_limit, 4, type: :int64
  field :new_public_limit, 5, type: :int64
end

defmodule Protocol.ParticipateAssetIssueContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          to_address: binary,
          asset_name: binary,
          amount: integer
        }

  defstruct [:owner_address, :to_address, :asset_name, :amount]

  field :owner_address, 1, type: :bytes
  field :to_address, 2, type: :bytes
  field :asset_name, 3, type: :bytes
  field :amount, 4, type: :int64
end
