defmodule Protocol.AccountType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :Normal | :AssetIssue | :Contract

  field :Normal, 0

  field :AssetIssue, 1

  field :Contract, 2
end

defmodule Protocol.ReasonCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :REQUESTED
          | :BAD_PROTOCOL
          | :TOO_MANY_PEERS
          | :DUPLICATE_PEER
          | :INCOMPATIBLE_PROTOCOL
          | :NULL_IDENTITY
          | :PEER_QUITING
          | :UNEXPECTED_IDENTITY
          | :LOCAL_IDENTITY
          | :PING_TIMEOUT
          | :USER_REASON
          | :RESET
          | :SYNC_FAIL
          | :FETCH_FAIL
          | :BAD_TX
          | :BAD_BLOCK
          | :FORKED
          | :UNLINKABLE
          | :INCOMPATIBLE_VERSION
          | :INCOMPATIBLE_CHAIN
          | :TIME_OUT
          | :CONNECT_FAIL
          | :TOO_MANY_PEERS_WITH_SAME_IP
          | :UNKNOWN

  field :REQUESTED, 0

  field :BAD_PROTOCOL, 2

  field :TOO_MANY_PEERS, 4

  field :DUPLICATE_PEER, 5

  field :INCOMPATIBLE_PROTOCOL, 6

  field :NULL_IDENTITY, 7

  field :PEER_QUITING, 8

  field :UNEXPECTED_IDENTITY, 9

  field :LOCAL_IDENTITY, 10

  field :PING_TIMEOUT, 11

  field :USER_REASON, 16

  field :RESET, 17

  field :SYNC_FAIL, 18

  field :FETCH_FAIL, 19

  field :BAD_TX, 20

  field :BAD_BLOCK, 21

  field :FORKED, 22

  field :UNLINKABLE, 23

  field :INCOMPATIBLE_VERSION, 24

  field :INCOMPATIBLE_CHAIN, 25

  field :TIME_OUT, 32

  field :CONNECT_FAIL, 33

  field :TOO_MANY_PEERS_WITH_SAME_IP, 34

  field :UNKNOWN, 255
end

defmodule Protocol.Proposal.State do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :PENDING | :DISAPPROVED | :APPROVED | :CANCELED

  field :PENDING, 0

  field :DISAPPROVED, 1

  field :APPROVED, 2

  field :CANCELED, 3
end

defmodule Protocol.MarketOrder.State do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :ACTIVE | :INACTIVE | :CANCELED

  field :ACTIVE, 0

  field :INACTIVE, 1

  field :CANCELED, 2
end

defmodule Protocol.Permission.PermissionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :Owner | :Witness | :Active

  field :Owner, 0

  field :Witness, 1

  field :Active, 2
end

defmodule Protocol.Transaction.Contract.ContractType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :AccountCreateContract
          | :TransferContract
          | :TransferAssetContract
          | :VoteAssetContract
          | :VoteWitnessContract
          | :WitnessCreateContract
          | :AssetIssueContract
          | :WitnessUpdateContract
          | :ParticipateAssetIssueContract
          | :AccountUpdateContract
          | :FreezeBalanceContract
          | :UnfreezeBalanceContract
          | :WithdrawBalanceContract
          | :UnfreezeAssetContract
          | :UpdateAssetContract
          | :ProposalCreateContract
          | :ProposalApproveContract
          | :ProposalDeleteContract
          | :SetAccountIdContract
          | :CustomContract
          | :CreateSmartContract
          | :TriggerSmartContract
          | :GetContract
          | :UpdateSettingContract
          | :ExchangeCreateContract
          | :ExchangeInjectContract
          | :ExchangeWithdrawContract
          | :ExchangeTransactionContract
          | :UpdateEnergyLimitContract
          | :AccountPermissionUpdateContract
          | :ClearABIContract
          | :UpdateBrokerageContract
          | :ShieldedTransferContract
          | :MarketSellAssetContract
          | :MarketCancelOrderContract

  field :AccountCreateContract, 0

  field :TransferContract, 1

  field :TransferAssetContract, 2

  field :VoteAssetContract, 3

  field :VoteWitnessContract, 4

  field :WitnessCreateContract, 5

  field :AssetIssueContract, 6

  field :WitnessUpdateContract, 8

  field :ParticipateAssetIssueContract, 9

  field :AccountUpdateContract, 10

  field :FreezeBalanceContract, 11

  field :UnfreezeBalanceContract, 12

  field :WithdrawBalanceContract, 13

  field :UnfreezeAssetContract, 14

  field :UpdateAssetContract, 15

  field :ProposalCreateContract, 16

  field :ProposalApproveContract, 17

  field :ProposalDeleteContract, 18

  field :SetAccountIdContract, 19

  field :CustomContract, 20

  field :CreateSmartContract, 30

  field :TriggerSmartContract, 31

  field :GetContract, 32

  field :UpdateSettingContract, 33

  field :ExchangeCreateContract, 41

  field :ExchangeInjectContract, 42

  field :ExchangeWithdrawContract, 43

  field :ExchangeTransactionContract, 44

  field :UpdateEnergyLimitContract, 45

  field :AccountPermissionUpdateContract, 46

  field :ClearABIContract, 48

  field :UpdateBrokerageContract, 49

  field :ShieldedTransferContract, 51

  field :MarketSellAssetContract, 52

  field :MarketCancelOrderContract, 53
end

defmodule Protocol.Transaction.Result.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :SUCESS | :FAILED

  field :SUCESS, 0

  field :FAILED, 1
end

defmodule Protocol.Transaction.Result.ContractResult do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :DEFAULT
          | :SUCCESS
          | :REVERT
          | :BAD_JUMP_DESTINATION
          | :OUT_OF_MEMORY
          | :PRECOMPILED_CONTRACT
          | :STACK_TOO_SMALL
          | :STACK_TOO_LARGE
          | :ILLEGAL_OPERATION
          | :STACK_OVERFLOW
          | :OUT_OF_ENERGY
          | :OUT_OF_TIME
          | :JVM_STACK_OVER_FLOW
          | :UNKNOWN
          | :TRANSFER_FAILED

  field :DEFAULT, 0

  field :SUCCESS, 1

  field :REVERT, 2

  field :BAD_JUMP_DESTINATION, 3

  field :OUT_OF_MEMORY, 4

  field :PRECOMPILED_CONTRACT, 5

  field :STACK_TOO_SMALL, 6

  field :STACK_TOO_LARGE, 7

  field :ILLEGAL_OPERATION, 8

  field :STACK_OVERFLOW, 9

  field :OUT_OF_ENERGY, 10

  field :OUT_OF_TIME, 11

  field :JVM_STACK_OVER_FLOW, 12

  field :UNKNOWN, 13

  field :TRANSFER_FAILED, 14
end

defmodule Protocol.TransactionInfo.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :SUCESS | :FAILED

  field :SUCESS, 0

  field :FAILED, 1
end

defmodule Protocol.BlockInventory.Type do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :SYNC | :ADVTISE | :FETCH

  field :SYNC, 0

  field :ADVTISE, 1

  field :FETCH, 2
end

defmodule Protocol.Inventory.InventoryType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :TRX | :BLOCK

  field :TRX, 0

  field :BLOCK, 1
end

defmodule Protocol.Items.ItemType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :ERR | :TRX | :BLOCK | :BLOCKHEADER

  field :ERR, 0

  field :TRX, 1

  field :BLOCK, 2

  field :BLOCKHEADER, 3
end

defmodule Protocol.PBFTMessage.MsgType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :VIEW_CHANGE | :REQUEST | :PREPREPARE | :PREPARE | :COMMIT

  field :VIEW_CHANGE, 0

  field :REQUEST, 1

  field :PREPREPARE, 2

  field :PREPARE, 3

  field :COMMIT, 4
end

defmodule Protocol.PBFTMessage.DataType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :BLOCK | :SRL

  field :BLOCK, 0

  field :SRL, 1
end

defmodule Protocol.AccountId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: binary,
          address: binary
        }

  defstruct [:name, :address]

  field :name, 1, type: :bytes
  field :address, 2, type: :bytes
end

defmodule Protocol.Vote do
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

defmodule Protocol.Proposal.ParametersEntry do
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

defmodule Protocol.Proposal do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          proposal_id: integer,
          proposer_address: binary,
          parameters: %{integer => integer},
          expiration_time: integer,
          create_time: integer,
          approvals: [binary],
          state: Protocol.Proposal.State.t()
        }

  defstruct [
    :proposal_id,
    :proposer_address,
    :parameters,
    :expiration_time,
    :create_time,
    :approvals,
    :state
  ]

  field :proposal_id, 1, type: :int64
  field :proposer_address, 2, type: :bytes
  field :parameters, 3, repeated: true, type: Protocol.Proposal.ParametersEntry, map: true
  field :expiration_time, 4, type: :int64
  field :create_time, 5, type: :int64
  field :approvals, 6, repeated: true, type: :bytes
  field :state, 7, type: Protocol.Proposal.State, enum: true
end

defmodule Protocol.Exchange do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          exchange_id: integer,
          creator_address: binary,
          create_time: integer,
          first_token_id: binary,
          first_token_balance: integer,
          second_token_id: binary,
          second_token_balance: integer
        }

  defstruct [
    :exchange_id,
    :creator_address,
    :create_time,
    :first_token_id,
    :first_token_balance,
    :second_token_id,
    :second_token_balance
  ]

  field :exchange_id, 1, type: :int64
  field :creator_address, 2, type: :bytes
  field :create_time, 3, type: :int64
  field :first_token_id, 6, type: :bytes
  field :first_token_balance, 7, type: :int64
  field :second_token_id, 8, type: :bytes
  field :second_token_balance, 9, type: :int64
end

defmodule Protocol.MarketOrder do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          order_id: binary,
          owner_address: binary,
          create_time: integer,
          sell_token_id: binary,
          sell_token_quantity: integer,
          buy_token_id: binary,
          buy_token_quantity: integer,
          sell_token_quantity_remain: integer,
          sell_token_quantity_return: integer,
          state: Protocol.MarketOrder.State.t(),
          prev: binary,
          next: binary
        }

  defstruct [
    :order_id,
    :owner_address,
    :create_time,
    :sell_token_id,
    :sell_token_quantity,
    :buy_token_id,
    :buy_token_quantity,
    :sell_token_quantity_remain,
    :sell_token_quantity_return,
    :state,
    :prev,
    :next
  ]

  field :order_id, 1, type: :bytes
  field :owner_address, 2, type: :bytes
  field :create_time, 3, type: :int64
  field :sell_token_id, 4, type: :bytes
  field :sell_token_quantity, 5, type: :int64
  field :buy_token_id, 6, type: :bytes
  field :buy_token_quantity, 7, type: :int64
  field :sell_token_quantity_remain, 9, type: :int64
  field :sell_token_quantity_return, 10, type: :int64
  field :state, 11, type: Protocol.MarketOrder.State, enum: true
  field :prev, 12, type: :bytes
  field :next, 13, type: :bytes
end

defmodule Protocol.MarketOrderList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          orders: [Protocol.MarketOrder.t()]
        }

  defstruct [:orders]

  field :orders, 1, repeated: true, type: Protocol.MarketOrder
end

defmodule Protocol.MarketOrderPairList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          orderPair: [Protocol.MarketOrderPair.t()]
        }

  defstruct [:orderPair]

  field :orderPair, 1, repeated: true, type: Protocol.MarketOrderPair
end

defmodule Protocol.MarketOrderPair do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sell_token_id: binary,
          buy_token_id: binary
        }

  defstruct [:sell_token_id, :buy_token_id]

  field :sell_token_id, 1, type: :bytes
  field :buy_token_id, 2, type: :bytes
end

defmodule Protocol.MarketAccountOrder do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          orders: [binary],
          count: integer,
          total_count: integer
        }

  defstruct [:owner_address, :orders, :count, :total_count]

  field :owner_address, 1, type: :bytes
  field :orders, 2, repeated: true, type: :bytes
  field :count, 3, type: :int64
  field :total_count, 4, type: :int64
end

defmodule Protocol.MarketPrice do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sell_token_quantity: integer,
          buy_token_quantity: integer
        }

  defstruct [:sell_token_quantity, :buy_token_quantity]

  field :sell_token_quantity, 1, type: :int64
  field :buy_token_quantity, 2, type: :int64
end

defmodule Protocol.MarketPriceList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sell_token_id: binary,
          buy_token_id: binary,
          prices: [Protocol.MarketPrice.t()]
        }

  defstruct [:sell_token_id, :buy_token_id, :prices]

  field :sell_token_id, 1, type: :bytes
  field :buy_token_id, 2, type: :bytes
  field :prices, 3, repeated: true, type: Protocol.MarketPrice
end

defmodule Protocol.MarketOrderIdList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          head: binary,
          tail: binary
        }

  defstruct [:head, :tail]

  field :head, 1, type: :bytes
  field :tail, 2, type: :bytes
end

defmodule Protocol.ChainParameters.ChainParameter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.ChainParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chainParameter: [Protocol.ChainParameters.ChainParameter.t()]
        }

  defstruct [:chainParameter]

  field :chainParameter, 1, repeated: true, type: Protocol.ChainParameters.ChainParameter
end

defmodule Protocol.Account.Frozen do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frozen_balance: integer,
          expire_time: integer
        }

  defstruct [:frozen_balance, :expire_time]

  field :frozen_balance, 1, type: :int64
  field :expire_time, 2, type: :int64
end

defmodule Protocol.Account.AssetEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account.AssetV2Entry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account.LatestAssetOperationTimeEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account.LatestAssetOperationTimeV2Entry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account.FreeAssetNetUsageEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account.FreeAssetNetUsageV2Entry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account.AccountResource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          energy_usage: integer,
          frozen_balance_for_energy: Protocol.Account.Frozen.t() | nil,
          latest_consume_time_for_energy: integer,
          acquired_delegated_frozen_balance_for_energy: integer,
          delegated_frozen_balance_for_energy: integer,
          storage_limit: integer,
          storage_usage: integer,
          latest_exchange_storage_time: integer
        }

  defstruct [
    :energy_usage,
    :frozen_balance_for_energy,
    :latest_consume_time_for_energy,
    :acquired_delegated_frozen_balance_for_energy,
    :delegated_frozen_balance_for_energy,
    :storage_limit,
    :storage_usage,
    :latest_exchange_storage_time
  ]

  field :energy_usage, 1, type: :int64
  field :frozen_balance_for_energy, 2, type: Protocol.Account.Frozen
  field :latest_consume_time_for_energy, 3, type: :int64
  field :acquired_delegated_frozen_balance_for_energy, 4, type: :int64
  field :delegated_frozen_balance_for_energy, 5, type: :int64
  field :storage_limit, 6, type: :int64
  field :storage_usage, 7, type: :int64
  field :latest_exchange_storage_time, 8, type: :int64
end

defmodule Protocol.Account do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_name: binary,
          type: Protocol.AccountType.t(),
          address: binary,
          balance: integer,
          votes: [Protocol.Vote.t()],
          asset: %{String.t() => integer},
          assetV2: %{String.t() => integer},
          frozen: [Protocol.Account.Frozen.t()],
          net_usage: integer,
          acquired_delegated_frozen_balance_for_bandwidth: integer,
          delegated_frozen_balance_for_bandwidth: integer,
          old_tron_power: integer,
          tron_power: Protocol.Account.Frozen.t() | nil,
          create_time: integer,
          latest_opration_time: integer,
          allowance: integer,
          latest_withdraw_time: integer,
          code: binary,
          is_witness: boolean,
          is_committee: boolean,
          frozen_supply: [Protocol.Account.Frozen.t()],
          asset_issued_name: binary,
          asset_issued_ID: binary,
          latest_asset_operation_time: %{String.t() => integer},
          latest_asset_operation_timeV2: %{String.t() => integer},
          free_net_usage: integer,
          free_asset_net_usage: %{String.t() => integer},
          free_asset_net_usageV2: %{String.t() => integer},
          latest_consume_time: integer,
          latest_consume_free_time: integer,
          account_id: binary,
          account_resource: Protocol.Account.AccountResource.t() | nil,
          codeHash: binary,
          owner_permission: Protocol.Permission.t() | nil,
          witness_permission: Protocol.Permission.t() | nil,
          active_permission: [Protocol.Permission.t()]
        }

  defstruct [
    :account_name,
    :type,
    :address,
    :balance,
    :votes,
    :asset,
    :assetV2,
    :frozen,
    :net_usage,
    :acquired_delegated_frozen_balance_for_bandwidth,
    :delegated_frozen_balance_for_bandwidth,
    :old_tron_power,
    :tron_power,
    :create_time,
    :latest_opration_time,
    :allowance,
    :latest_withdraw_time,
    :code,
    :is_witness,
    :is_committee,
    :frozen_supply,
    :asset_issued_name,
    :asset_issued_ID,
    :latest_asset_operation_time,
    :latest_asset_operation_timeV2,
    :free_net_usage,
    :free_asset_net_usage,
    :free_asset_net_usageV2,
    :latest_consume_time,
    :latest_consume_free_time,
    :account_id,
    :account_resource,
    :codeHash,
    :owner_permission,
    :witness_permission,
    :active_permission
  ]

  field :account_name, 1, type: :bytes
  field :type, 2, type: Protocol.AccountType, enum: true
  field :address, 3, type: :bytes
  field :balance, 4, type: :int64
  field :votes, 5, repeated: true, type: Protocol.Vote
  field :asset, 6, repeated: true, type: Protocol.Account.AssetEntry, map: true
  field :assetV2, 56, repeated: true, type: Protocol.Account.AssetV2Entry, map: true
  field :frozen, 7, repeated: true, type: Protocol.Account.Frozen
  field :net_usage, 8, type: :int64
  field :acquired_delegated_frozen_balance_for_bandwidth, 41, type: :int64
  field :delegated_frozen_balance_for_bandwidth, 42, type: :int64
  field :old_tron_power, 46, type: :int64
  field :tron_power, 47, type: Protocol.Account.Frozen
  field :create_time, 9, type: :int64
  field :latest_opration_time, 10, type: :int64
  field :allowance, 11, type: :int64
  field :latest_withdraw_time, 12, type: :int64
  field :code, 13, type: :bytes
  field :is_witness, 14, type: :bool
  field :is_committee, 15, type: :bool
  field :frozen_supply, 16, repeated: true, type: Protocol.Account.Frozen
  field :asset_issued_name, 17, type: :bytes
  field :asset_issued_ID, 57, type: :bytes

  field :latest_asset_operation_time, 18,
    repeated: true,
    type: Protocol.Account.LatestAssetOperationTimeEntry,
    map: true

  field :latest_asset_operation_timeV2, 58,
    repeated: true,
    type: Protocol.Account.LatestAssetOperationTimeV2Entry,
    map: true

  field :free_net_usage, 19, type: :int64

  field :free_asset_net_usage, 20,
    repeated: true,
    type: Protocol.Account.FreeAssetNetUsageEntry,
    map: true

  field :free_asset_net_usageV2, 59,
    repeated: true,
    type: Protocol.Account.FreeAssetNetUsageV2Entry,
    map: true

  field :latest_consume_time, 21, type: :int64
  field :latest_consume_free_time, 22, type: :int64
  field :account_id, 23, type: :bytes
  field :account_resource, 26, type: Protocol.Account.AccountResource
  field :codeHash, 30, type: :bytes
  field :owner_permission, 31, type: Protocol.Permission
  field :witness_permission, 32, type: Protocol.Permission
  field :active_permission, 33, repeated: true, type: Protocol.Permission
end

defmodule Protocol.AccountAsset.Frozen do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frozen_balance: integer,
          expire_time: integer
        }

  defstruct [:frozen_balance, :expire_time]

  field :frozen_balance, 1, type: :int64
  field :expire_time, 2, type: :int64
end

defmodule Protocol.AccountAsset.AssetEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.AccountAsset.AssetV2Entry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.AccountAsset.LatestAssetOperationTimeEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.AccountAsset.LatestAssetOperationTimeV2Entry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.AccountAsset.FreeAssetNetUsageEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.AccountAsset.FreeAssetNetUsageV2Entry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.AccountAsset do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary,
          asset: %{String.t() => integer},
          assetV2: %{String.t() => integer},
          asset_issued_name: binary,
          asset_issued_ID: binary,
          latest_asset_operation_time: %{String.t() => integer},
          latest_asset_operation_timeV2: %{String.t() => integer},
          free_asset_net_usage: %{String.t() => integer},
          free_asset_net_usageV2: %{String.t() => integer},
          frozen_supply: [Protocol.AccountAsset.Frozen.t()]
        }

  defstruct [
    :address,
    :asset,
    :assetV2,
    :asset_issued_name,
    :asset_issued_ID,
    :latest_asset_operation_time,
    :latest_asset_operation_timeV2,
    :free_asset_net_usage,
    :free_asset_net_usageV2,
    :frozen_supply
  ]

  field :address, 1, type: :bytes
  field :asset, 2, repeated: true, type: Protocol.AccountAsset.AssetEntry, map: true
  field :assetV2, 3, repeated: true, type: Protocol.AccountAsset.AssetV2Entry, map: true
  field :asset_issued_name, 4, type: :bytes
  field :asset_issued_ID, 5, type: :bytes

  field :latest_asset_operation_time, 6,
    repeated: true,
    type: Protocol.AccountAsset.LatestAssetOperationTimeEntry,
    map: true

  field :latest_asset_operation_timeV2, 7,
    repeated: true,
    type: Protocol.AccountAsset.LatestAssetOperationTimeV2Entry,
    map: true

  field :free_asset_net_usage, 8,
    repeated: true,
    type: Protocol.AccountAsset.FreeAssetNetUsageEntry,
    map: true

  field :free_asset_net_usageV2, 9,
    repeated: true,
    type: Protocol.AccountAsset.FreeAssetNetUsageV2Entry,
    map: true

  field :frozen_supply, 10, repeated: true, type: Protocol.AccountAsset.Frozen
end

defmodule Protocol.Key do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary,
          weight: integer
        }

  defstruct [:address, :weight]

  field :address, 1, type: :bytes
  field :weight, 2, type: :int64
end

defmodule Protocol.DelegatedResource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: binary,
          to: binary,
          frozen_balance_for_bandwidth: integer,
          frozen_balance_for_energy: integer,
          expire_time_for_bandwidth: integer,
          expire_time_for_energy: integer
        }

  defstruct [
    :from,
    :to,
    :frozen_balance_for_bandwidth,
    :frozen_balance_for_energy,
    :expire_time_for_bandwidth,
    :expire_time_for_energy
  ]

  field :from, 1, type: :bytes
  field :to, 2, type: :bytes
  field :frozen_balance_for_bandwidth, 3, type: :int64
  field :frozen_balance_for_energy, 4, type: :int64
  field :expire_time_for_bandwidth, 5, type: :int64
  field :expire_time_for_energy, 6, type: :int64
end

defmodule Protocol.Authority do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account: Protocol.AccountId.t() | nil,
          permission_name: binary
        }

  defstruct [:account, :permission_name]

  field :account, 1, type: Protocol.AccountId
  field :permission_name, 2, type: :bytes
end

defmodule Protocol.Permission do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: Protocol.Permission.PermissionType.t(),
          id: integer,
          permission_name: String.t(),
          threshold: integer,
          parent_id: integer,
          operations: binary,
          keys: [Protocol.Key.t()]
        }

  defstruct [:type, :id, :permission_name, :threshold, :parent_id, :operations, :keys]

  field :type, 1, type: Protocol.Permission.PermissionType, enum: true
  field :id, 2, type: :int32
  field :permission_name, 3, type: :string
  field :threshold, 4, type: :int64
  field :parent_id, 5, type: :int32
  field :operations, 6, type: :bytes
  field :keys, 7, repeated: true, type: Protocol.Key
end

defmodule Protocol.Witness do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary,
          voteCount: integer,
          pubKey: binary,
          url: String.t(),
          totalProduced: integer,
          totalMissed: integer,
          latestBlockNum: integer,
          latestSlotNum: integer,
          isJobs: boolean
        }

  defstruct [
    :address,
    :voteCount,
    :pubKey,
    :url,
    :totalProduced,
    :totalMissed,
    :latestBlockNum,
    :latestSlotNum,
    :isJobs
  ]

  field :address, 1, type: :bytes
  field :voteCount, 2, type: :int64
  field :pubKey, 3, type: :bytes
  field :url, 4, type: :string
  field :totalProduced, 5, type: :int64
  field :totalMissed, 6, type: :int64
  field :latestBlockNum, 7, type: :int64
  field :latestSlotNum, 8, type: :int64
  field :isJobs, 9, type: :bool
end

defmodule Protocol.Votes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary,
          old_votes: [Protocol.Vote.t()],
          new_votes: [Protocol.Vote.t()]
        }

  defstruct [:address, :old_votes, :new_votes]

  field :address, 1, type: :bytes
  field :old_votes, 2, repeated: true, type: Protocol.Vote
  field :new_votes, 3, repeated: true, type: Protocol.Vote
end

defmodule Protocol.TXOutput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: integer,
          pubKeyHash: binary
        }

  defstruct [:value, :pubKeyHash]

  field :value, 1, type: :int64
  field :pubKeyHash, 2, type: :bytes
end

defmodule Protocol.TXInput.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txID: binary,
          vout: integer,
          pubKey: binary
        }

  defstruct [:txID, :vout, :pubKey]

  field :txID, 1, type: :bytes
  field :vout, 2, type: :int64
  field :pubKey, 3, type: :bytes
end

defmodule Protocol.TXInput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Protocol.TXInput.Raw.t() | nil,
          signature: binary
        }

  defstruct [:raw_data, :signature]

  field :raw_data, 1, type: Protocol.TXInput.Raw
  field :signature, 4, type: :bytes
end

defmodule Protocol.TXOutputs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          outputs: [Protocol.TXOutput.t()]
        }

  defstruct [:outputs]

  field :outputs, 1, repeated: true, type: Protocol.TXOutput
end

defmodule Protocol.ResourceReceipt do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          energy_usage: integer,
          energy_fee: integer,
          origin_energy_usage: integer,
          energy_usage_total: integer,
          net_usage: integer,
          net_fee: integer,
          result: Protocol.Transaction.Result.ContractResult.t()
        }

  defstruct [
    :energy_usage,
    :energy_fee,
    :origin_energy_usage,
    :energy_usage_total,
    :net_usage,
    :net_fee,
    :result
  ]

  field :energy_usage, 1, type: :int64
  field :energy_fee, 2, type: :int64
  field :origin_energy_usage, 3, type: :int64
  field :energy_usage_total, 4, type: :int64
  field :net_usage, 5, type: :int64
  field :net_fee, 6, type: :int64
  field :result, 7, type: Protocol.Transaction.Result.ContractResult, enum: true
end

defmodule Protocol.MarketOrderDetail do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          makerOrderId: binary,
          takerOrderId: binary,
          fillSellQuantity: integer,
          fillBuyQuantity: integer
        }

  defstruct [:makerOrderId, :takerOrderId, :fillSellQuantity, :fillBuyQuantity]

  field :makerOrderId, 1, type: :bytes
  field :takerOrderId, 2, type: :bytes
  field :fillSellQuantity, 3, type: :int64
  field :fillBuyQuantity, 4, type: :int64
end

defmodule Protocol.Transaction.Contract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: Protocol.Transaction.Contract.ContractType.t(),
          parameter: Google.Protobuf.Any.t() | nil,
          provider: binary,
          ContractName: binary,
          Permission_id: integer
        }

  defstruct [:type, :parameter, :provider, :ContractName, :Permission_id]

  field :type, 1, type: Protocol.Transaction.Contract.ContractType, enum: true
  field :parameter, 2, type: Google.Protobuf.Any
  field :provider, 3, type: :bytes
  field :ContractName, 4, type: :bytes
  field :Permission_id, 5, type: :int32
end

defmodule Protocol.Transaction.Result do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fee: integer,
          ret: Protocol.Transaction.Result.Code.t(),
          contractRet: Protocol.Transaction.Result.ContractResult.t(),
          assetIssueID: String.t(),
          withdraw_amount: integer,
          unfreeze_amount: integer,
          exchange_received_amount: integer,
          exchange_inject_another_amount: integer,
          exchange_withdraw_another_amount: integer,
          exchange_id: integer,
          shielded_transaction_fee: integer,
          orderId: binary,
          orderDetails: [Protocol.MarketOrderDetail.t()]
        }

  defstruct [
    :fee,
    :ret,
    :contractRet,
    :assetIssueID,
    :withdraw_amount,
    :unfreeze_amount,
    :exchange_received_amount,
    :exchange_inject_another_amount,
    :exchange_withdraw_another_amount,
    :exchange_id,
    :shielded_transaction_fee,
    :orderId,
    :orderDetails
  ]

  field :fee, 1, type: :int64
  field :ret, 2, type: Protocol.Transaction.Result.Code, enum: true
  field :contractRet, 3, type: Protocol.Transaction.Result.ContractResult, enum: true
  field :assetIssueID, 14, type: :string
  field :withdraw_amount, 15, type: :int64
  field :unfreeze_amount, 16, type: :int64
  field :exchange_received_amount, 18, type: :int64
  field :exchange_inject_another_amount, 19, type: :int64
  field :exchange_withdraw_another_amount, 20, type: :int64
  field :exchange_id, 21, type: :int64
  field :shielded_transaction_fee, 22, type: :int64
  field :orderId, 25, type: :bytes
  field :orderDetails, 26, repeated: true, type: Protocol.MarketOrderDetail
end

defmodule Protocol.Transaction.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ref_block_bytes: binary,
          ref_block_num: integer,
          ref_block_hash: binary,
          expiration: integer,
          auths: [Protocol.Authority.t()],
          data: binary,
          contract: [Protocol.Transaction.Contract.t()],
          scripts: binary,
          timestamp: integer,
          fee_limit: integer
        }

  defstruct [
    :ref_block_bytes,
    :ref_block_num,
    :ref_block_hash,
    :expiration,
    :auths,
    :data,
    :contract,
    :scripts,
    :timestamp,
    :fee_limit
  ]

  field :ref_block_bytes, 1, type: :bytes
  field :ref_block_num, 3, type: :int64
  field :ref_block_hash, 4, type: :bytes
  field :expiration, 8, type: :int64
  field :auths, 9, repeated: true, type: Protocol.Authority
  field :data, 10, type: :bytes
  field :contract, 11, repeated: true, type: Protocol.Transaction.Contract
  field :scripts, 12, type: :bytes
  field :timestamp, 14, type: :int64
  field :fee_limit, 18, type: :int64
end

defmodule Protocol.Transaction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Protocol.Transaction.Raw.t() | nil,
          signature: [binary],
          ret: [Protocol.Transaction.Result.t()]
        }

  defstruct [:raw_data, :signature, :ret]

  field :raw_data, 1, type: Protocol.Transaction.Raw
  field :signature, 2, repeated: true, type: :bytes
  field :ret, 5, repeated: true, type: Protocol.Transaction.Result
end

defmodule Protocol.TransactionInfo.Log do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary,
          topics: [binary],
          data: binary
        }

  defstruct [:address, :topics, :data]

  field :address, 1, type: :bytes
  field :topics, 2, repeated: true, type: :bytes
  field :data, 3, type: :bytes
end

defmodule Protocol.TransactionInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: binary,
          fee: integer,
          blockNumber: integer,
          blockTimeStamp: integer,
          contractResult: [binary],
          contract_address: binary,
          receipt: Protocol.ResourceReceipt.t() | nil,
          log: [Protocol.TransactionInfo.Log.t()],
          result: Protocol.TransactionInfo.Code.t(),
          resMessage: binary,
          assetIssueID: String.t(),
          withdraw_amount: integer,
          unfreeze_amount: integer,
          internal_transactions: [Protocol.InternalTransaction.t()],
          exchange_received_amount: integer,
          exchange_inject_another_amount: integer,
          exchange_withdraw_another_amount: integer,
          exchange_id: integer,
          shielded_transaction_fee: integer,
          orderId: binary,
          orderDetails: [Protocol.MarketOrderDetail.t()],
          packingFee: integer
        }

  defstruct [
    :id,
    :fee,
    :blockNumber,
    :blockTimeStamp,
    :contractResult,
    :contract_address,
    :receipt,
    :log,
    :result,
    :resMessage,
    :assetIssueID,
    :withdraw_amount,
    :unfreeze_amount,
    :internal_transactions,
    :exchange_received_amount,
    :exchange_inject_another_amount,
    :exchange_withdraw_another_amount,
    :exchange_id,
    :shielded_transaction_fee,
    :orderId,
    :orderDetails,
    :packingFee
  ]

  field :id, 1, type: :bytes
  field :fee, 2, type: :int64
  field :blockNumber, 3, type: :int64
  field :blockTimeStamp, 4, type: :int64
  field :contractResult, 5, repeated: true, type: :bytes
  field :contract_address, 6, type: :bytes
  field :receipt, 7, type: Protocol.ResourceReceipt
  field :log, 8, repeated: true, type: Protocol.TransactionInfo.Log
  field :result, 9, type: Protocol.TransactionInfo.Code, enum: true
  field :resMessage, 10, type: :bytes
  field :assetIssueID, 14, type: :string
  field :withdraw_amount, 15, type: :int64
  field :unfreeze_amount, 16, type: :int64
  field :internal_transactions, 17, repeated: true, type: Protocol.InternalTransaction
  field :exchange_received_amount, 18, type: :int64
  field :exchange_inject_another_amount, 19, type: :int64
  field :exchange_withdraw_another_amount, 20, type: :int64
  field :exchange_id, 21, type: :int64
  field :shielded_transaction_fee, 22, type: :int64
  field :orderId, 25, type: :bytes
  field :orderDetails, 26, repeated: true, type: Protocol.MarketOrderDetail
  field :packingFee, 27, type: :int64
end

defmodule Protocol.TransactionRet do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          blockNumber: integer,
          blockTimeStamp: integer,
          transactioninfo: [Protocol.TransactionInfo.t()]
        }

  defstruct [:blockNumber, :blockTimeStamp, :transactioninfo]

  field :blockNumber, 1, type: :int64
  field :blockTimeStamp, 2, type: :int64
  field :transactioninfo, 3, repeated: true, type: Protocol.TransactionInfo
end

defmodule Protocol.Transactions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Protocol.Transaction.t()]
        }

  defstruct [:transactions]

  field :transactions, 1, repeated: true, type: Protocol.Transaction
end

defmodule Protocol.TransactionSign do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Protocol.Transaction.t() | nil,
          privateKey: binary
        }

  defstruct [:transaction, :privateKey]

  field :transaction, 1, type: Protocol.Transaction
  field :privateKey, 2, type: :bytes
end

defmodule Protocol.BlockHeader.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timestamp: integer,
          txTrieRoot: binary,
          parentHash: binary,
          number: integer,
          witness_id: integer,
          witness_address: binary,
          version: integer,
          accountStateRoot: binary
        }

  defstruct [
    :timestamp,
    :txTrieRoot,
    :parentHash,
    :number,
    :witness_id,
    :witness_address,
    :version,
    :accountStateRoot
  ]

  field :timestamp, 1, type: :int64
  field :txTrieRoot, 2, type: :bytes
  field :parentHash, 3, type: :bytes
  field :number, 7, type: :int64
  field :witness_id, 8, type: :int64
  field :witness_address, 9, type: :bytes
  field :version, 10, type: :int32
  field :accountStateRoot, 11, type: :bytes
end

defmodule Protocol.BlockHeader do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Protocol.BlockHeader.Raw.t() | nil,
          witness_signature: binary
        }

  defstruct [:raw_data, :witness_signature]

  field :raw_data, 1, type: Protocol.BlockHeader.Raw
  field :witness_signature, 2, type: :bytes
end

defmodule Protocol.Block do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Protocol.Transaction.t()],
          block_header: Protocol.BlockHeader.t() | nil
        }

  defstruct [:transactions, :block_header]

  field :transactions, 1, repeated: true, type: Protocol.Transaction
  field :block_header, 2, type: Protocol.BlockHeader
end

defmodule Protocol.ChainInventory.BlockId do
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

defmodule Protocol.ChainInventory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ids: [Protocol.ChainInventory.BlockId.t()],
          remain_num: integer
        }

  defstruct [:ids, :remain_num]

  field :ids, 1, repeated: true, type: Protocol.ChainInventory.BlockId
  field :remain_num, 2, type: :int64
end

defmodule Protocol.BlockInventory.BlockId do
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

defmodule Protocol.BlockInventory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ids: [Protocol.BlockInventory.BlockId.t()],
          type: Protocol.BlockInventory.Type.t()
        }

  defstruct [:ids, :type]

  field :ids, 1, repeated: true, type: Protocol.BlockInventory.BlockId
  field :type, 2, type: Protocol.BlockInventory.Type, enum: true
end

defmodule Protocol.Inventory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: Protocol.Inventory.InventoryType.t(),
          ids: [binary]
        }

  defstruct [:type, :ids]

  field :type, 1, type: Protocol.Inventory.InventoryType, enum: true
  field :ids, 2, repeated: true, type: :bytes
end

defmodule Protocol.Items do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: Protocol.Items.ItemType.t(),
          blocks: [Protocol.Block.t()],
          block_headers: [Protocol.BlockHeader.t()],
          transactions: [Protocol.Transaction.t()]
        }

  defstruct [:type, :blocks, :block_headers, :transactions]

  field :type, 1, type: Protocol.Items.ItemType, enum: true
  field :blocks, 2, repeated: true, type: Protocol.Block
  field :block_headers, 3, repeated: true, type: Protocol.BlockHeader
  field :transactions, 4, repeated: true, type: Protocol.Transaction
end

defmodule Protocol.DynamicProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          last_solidity_block_num: integer
        }

  defstruct [:last_solidity_block_num]

  field :last_solidity_block_num, 1, type: :int64
end

defmodule Protocol.DisconnectMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: Protocol.ReasonCode.t()
        }

  defstruct [:reason]

  field :reason, 1, type: Protocol.ReasonCode, enum: true
end

defmodule Protocol.HelloMessage.BlockId do
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

defmodule Protocol.HelloMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: Protocol.Endpoint.t() | nil,
          version: integer,
          timestamp: integer,
          genesisBlockId: Protocol.HelloMessage.BlockId.t() | nil,
          solidBlockId: Protocol.HelloMessage.BlockId.t() | nil,
          headBlockId: Protocol.HelloMessage.BlockId.t() | nil,
          address: binary,
          signature: binary
        }

  defstruct [
    :from,
    :version,
    :timestamp,
    :genesisBlockId,
    :solidBlockId,
    :headBlockId,
    :address,
    :signature
  ]

  field :from, 1, type: Protocol.Endpoint
  field :version, 2, type: :int32
  field :timestamp, 3, type: :int64
  field :genesisBlockId, 4, type: Protocol.HelloMessage.BlockId
  field :solidBlockId, 5, type: Protocol.HelloMessage.BlockId
  field :headBlockId, 6, type: Protocol.HelloMessage.BlockId
  field :address, 7, type: :bytes
  field :signature, 8, type: :bytes
end

defmodule Protocol.InternalTransaction.CallValueInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          callValue: integer,
          tokenId: String.t()
        }

  defstruct [:callValue, :tokenId]

  field :callValue, 1, type: :int64
  field :tokenId, 2, type: :string
end

defmodule Protocol.InternalTransaction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: binary,
          caller_address: binary,
          transferTo_address: binary,
          callValueInfo: [Protocol.InternalTransaction.CallValueInfo.t()],
          note: binary,
          rejected: boolean,
          extra: String.t()
        }

  defstruct [
    :hash,
    :caller_address,
    :transferTo_address,
    :callValueInfo,
    :note,
    :rejected,
    :extra
  ]

  field :hash, 1, type: :bytes
  field :caller_address, 2, type: :bytes
  field :transferTo_address, 3, type: :bytes
  field :callValueInfo, 4, repeated: true, type: Protocol.InternalTransaction.CallValueInfo
  field :note, 5, type: :bytes
  field :rejected, 6, type: :bool
  field :extra, 7, type: :string
end

defmodule Protocol.DelegatedResourceAccountIndex do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account: binary,
          fromAccounts: [binary],
          toAccounts: [binary]
        }

  defstruct [:account, :fromAccounts, :toAccounts]

  field :account, 1, type: :bytes
  field :fromAccounts, 2, repeated: true, type: :bytes
  field :toAccounts, 3, repeated: true, type: :bytes
end

defmodule Protocol.NodeInfo.CheatWitnessInfoMapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Protocol.NodeInfo.PeerInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          lastSyncBlock: String.t(),
          remainNum: integer,
          lastBlockUpdateTime: integer,
          syncFlag: boolean,
          headBlockTimeWeBothHave: integer,
          needSyncFromPeer: boolean,
          needSyncFromUs: boolean,
          host: String.t(),
          port: integer,
          nodeId: String.t(),
          connectTime: integer,
          avgLatency: float | :infinity | :negative_infinity | :nan,
          syncToFetchSize: integer,
          syncToFetchSizePeekNum: integer,
          syncBlockRequestedSize: integer,
          unFetchSynNum: integer,
          blockInPorcSize: integer,
          headBlockWeBothHave: String.t(),
          isActive: boolean,
          score: integer,
          nodeCount: integer,
          inFlow: integer,
          disconnectTimes: integer,
          localDisconnectReason: String.t(),
          remoteDisconnectReason: String.t()
        }

  defstruct [
    :lastSyncBlock,
    :remainNum,
    :lastBlockUpdateTime,
    :syncFlag,
    :headBlockTimeWeBothHave,
    :needSyncFromPeer,
    :needSyncFromUs,
    :host,
    :port,
    :nodeId,
    :connectTime,
    :avgLatency,
    :syncToFetchSize,
    :syncToFetchSizePeekNum,
    :syncBlockRequestedSize,
    :unFetchSynNum,
    :blockInPorcSize,
    :headBlockWeBothHave,
    :isActive,
    :score,
    :nodeCount,
    :inFlow,
    :disconnectTimes,
    :localDisconnectReason,
    :remoteDisconnectReason
  ]

  field :lastSyncBlock, 1, type: :string
  field :remainNum, 2, type: :int64
  field :lastBlockUpdateTime, 3, type: :int64
  field :syncFlag, 4, type: :bool
  field :headBlockTimeWeBothHave, 5, type: :int64
  field :needSyncFromPeer, 6, type: :bool
  field :needSyncFromUs, 7, type: :bool
  field :host, 8, type: :string
  field :port, 9, type: :int32
  field :nodeId, 10, type: :string
  field :connectTime, 11, type: :int64
  field :avgLatency, 12, type: :double
  field :syncToFetchSize, 13, type: :int32
  field :syncToFetchSizePeekNum, 14, type: :int64
  field :syncBlockRequestedSize, 15, type: :int32
  field :unFetchSynNum, 16, type: :int64
  field :blockInPorcSize, 17, type: :int32
  field :headBlockWeBothHave, 18, type: :string
  field :isActive, 19, type: :bool
  field :score, 20, type: :int32
  field :nodeCount, 21, type: :int32
  field :inFlow, 22, type: :int64
  field :disconnectTimes, 23, type: :int32
  field :localDisconnectReason, 24, type: :string
  field :remoteDisconnectReason, 25, type: :string
end

defmodule Protocol.NodeInfo.ConfigNodeInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          codeVersion: String.t(),
          p2pVersion: String.t(),
          listenPort: integer,
          discoverEnable: boolean,
          activeNodeSize: integer,
          passiveNodeSize: integer,
          sendNodeSize: integer,
          maxConnectCount: integer,
          sameIpMaxConnectCount: integer,
          backupListenPort: integer,
          backupMemberSize: integer,
          backupPriority: integer,
          dbVersion: integer,
          minParticipationRate: integer,
          supportConstant: boolean,
          minTimeRatio: float | :infinity | :negative_infinity | :nan,
          maxTimeRatio: float | :infinity | :negative_infinity | :nan,
          allowCreationOfContracts: integer,
          allowAdaptiveEnergy: integer
        }

  defstruct [
    :codeVersion,
    :p2pVersion,
    :listenPort,
    :discoverEnable,
    :activeNodeSize,
    :passiveNodeSize,
    :sendNodeSize,
    :maxConnectCount,
    :sameIpMaxConnectCount,
    :backupListenPort,
    :backupMemberSize,
    :backupPriority,
    :dbVersion,
    :minParticipationRate,
    :supportConstant,
    :minTimeRatio,
    :maxTimeRatio,
    :allowCreationOfContracts,
    :allowAdaptiveEnergy
  ]

  field :codeVersion, 1, type: :string
  field :p2pVersion, 2, type: :string
  field :listenPort, 3, type: :int32
  field :discoverEnable, 4, type: :bool
  field :activeNodeSize, 5, type: :int32
  field :passiveNodeSize, 6, type: :int32
  field :sendNodeSize, 7, type: :int32
  field :maxConnectCount, 8, type: :int32
  field :sameIpMaxConnectCount, 9, type: :int32
  field :backupListenPort, 10, type: :int32
  field :backupMemberSize, 11, type: :int32
  field :backupPriority, 12, type: :int32
  field :dbVersion, 13, type: :int32
  field :minParticipationRate, 14, type: :int32
  field :supportConstant, 15, type: :bool
  field :minTimeRatio, 16, type: :double
  field :maxTimeRatio, 17, type: :double
  field :allowCreationOfContracts, 18, type: :int64
  field :allowAdaptiveEnergy, 19, type: :int64
end

defmodule Protocol.NodeInfo.MachineInfo.MemoryDescInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          initSize: integer,
          useSize: integer,
          maxSize: integer,
          useRate: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:name, :initSize, :useSize, :maxSize, :useRate]

  field :name, 1, type: :string
  field :initSize, 2, type: :int64
  field :useSize, 3, type: :int64
  field :maxSize, 4, type: :int64
  field :useRate, 5, type: :double
end

defmodule Protocol.NodeInfo.MachineInfo.DeadLockThreadInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          lockName: String.t(),
          lockOwner: String.t(),
          state: String.t(),
          blockTime: integer,
          waitTime: integer,
          stackTrace: String.t()
        }

  defstruct [:name, :lockName, :lockOwner, :state, :blockTime, :waitTime, :stackTrace]

  field :name, 1, type: :string
  field :lockName, 2, type: :string
  field :lockOwner, 3, type: :string
  field :state, 4, type: :string
  field :blockTime, 5, type: :int64
  field :waitTime, 6, type: :int64
  field :stackTrace, 7, type: :string
end

defmodule Protocol.NodeInfo.MachineInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          threadCount: integer,
          deadLockThreadCount: integer,
          cpuCount: integer,
          totalMemory: integer,
          freeMemory: integer,
          cpuRate: float | :infinity | :negative_infinity | :nan,
          javaVersion: String.t(),
          osName: String.t(),
          jvmTotalMemory: integer,
          jvmFreeMemory: integer,
          processCpuRate: float | :infinity | :negative_infinity | :nan,
          memoryDescInfoList: [Protocol.NodeInfo.MachineInfo.MemoryDescInfo.t()],
          deadLockThreadInfoList: [Protocol.NodeInfo.MachineInfo.DeadLockThreadInfo.t()]
        }

  defstruct [
    :threadCount,
    :deadLockThreadCount,
    :cpuCount,
    :totalMemory,
    :freeMemory,
    :cpuRate,
    :javaVersion,
    :osName,
    :jvmTotalMemory,
    :jvmFreeMemory,
    :processCpuRate,
    :memoryDescInfoList,
    :deadLockThreadInfoList
  ]

  field :threadCount, 1, type: :int32
  field :deadLockThreadCount, 2, type: :int32
  field :cpuCount, 3, type: :int32
  field :totalMemory, 4, type: :int64
  field :freeMemory, 5, type: :int64
  field :cpuRate, 6, type: :double
  field :javaVersion, 7, type: :string
  field :osName, 8, type: :string
  field :jvmTotalMemory, 9, type: :int64
  field :jvmFreeMemory, 10, type: :int64
  field :processCpuRate, 11, type: :double

  field :memoryDescInfoList, 12,
    repeated: true,
    type: Protocol.NodeInfo.MachineInfo.MemoryDescInfo

  field :deadLockThreadInfoList, 13,
    repeated: true,
    type: Protocol.NodeInfo.MachineInfo.DeadLockThreadInfo
end

defmodule Protocol.NodeInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          beginSyncNum: integer,
          block: String.t(),
          solidityBlock: String.t(),
          currentConnectCount: integer,
          activeConnectCount: integer,
          passiveConnectCount: integer,
          totalFlow: integer,
          peerInfoList: [Protocol.NodeInfo.PeerInfo.t()],
          configNodeInfo: Protocol.NodeInfo.ConfigNodeInfo.t() | nil,
          machineInfo: Protocol.NodeInfo.MachineInfo.t() | nil,
          cheatWitnessInfoMap: %{String.t() => String.t()}
        }

  defstruct [
    :beginSyncNum,
    :block,
    :solidityBlock,
    :currentConnectCount,
    :activeConnectCount,
    :passiveConnectCount,
    :totalFlow,
    :peerInfoList,
    :configNodeInfo,
    :machineInfo,
    :cheatWitnessInfoMap
  ]

  field :beginSyncNum, 1, type: :int64
  field :block, 2, type: :string
  field :solidityBlock, 3, type: :string
  field :currentConnectCount, 4, type: :int32
  field :activeConnectCount, 5, type: :int32
  field :passiveConnectCount, 6, type: :int32
  field :totalFlow, 7, type: :int64
  field :peerInfoList, 8, repeated: true, type: Protocol.NodeInfo.PeerInfo
  field :configNodeInfo, 9, type: Protocol.NodeInfo.ConfigNodeInfo
  field :machineInfo, 10, type: Protocol.NodeInfo.MachineInfo

  field :cheatWitnessInfoMap, 11,
    repeated: true,
    type: Protocol.NodeInfo.CheatWitnessInfoMapEntry,
    map: true
end

defmodule Protocol.MetricsInfo.NodeInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ip: String.t(),
          nodeType: integer,
          version: String.t(),
          backupStatus: integer
        }

  defstruct [:ip, :nodeType, :version, :backupStatus]

  field :ip, 1, type: :string
  field :nodeType, 2, type: :int32
  field :version, 3, type: :string
  field :backupStatus, 4, type: :int32
end

defmodule Protocol.MetricsInfo.BlockChainInfo.Witness do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          version: integer
        }

  defstruct [:address, :version]

  field :address, 1, type: :string
  field :version, 2, type: :int32
end

defmodule Protocol.MetricsInfo.BlockChainInfo.DupWitness do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          blockNum: integer,
          count: integer
        }

  defstruct [:address, :blockNum, :count]

  field :address, 1, type: :string
  field :blockNum, 2, type: :int64
  field :count, 3, type: :int32
end

defmodule Protocol.MetricsInfo.BlockChainInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          headBlockNum: integer,
          headBlockTimestamp: integer,
          headBlockHash: String.t(),
          forkCount: integer,
          failForkCount: integer,
          blockProcessTime: Protocol.MetricsInfo.RateInfo.t() | nil,
          tps: Protocol.MetricsInfo.RateInfo.t() | nil,
          transactionCacheSize: integer,
          missedTransaction: Protocol.MetricsInfo.RateInfo.t() | nil,
          witnesses: [Protocol.MetricsInfo.BlockChainInfo.Witness.t()],
          failProcessBlockNum: integer,
          failProcessBlockReason: String.t(),
          dupWitness: [Protocol.MetricsInfo.BlockChainInfo.DupWitness.t()]
        }

  defstruct [
    :headBlockNum,
    :headBlockTimestamp,
    :headBlockHash,
    :forkCount,
    :failForkCount,
    :blockProcessTime,
    :tps,
    :transactionCacheSize,
    :missedTransaction,
    :witnesses,
    :failProcessBlockNum,
    :failProcessBlockReason,
    :dupWitness
  ]

  field :headBlockNum, 1, type: :int64
  field :headBlockTimestamp, 2, type: :int64
  field :headBlockHash, 3, type: :string
  field :forkCount, 4, type: :int32
  field :failForkCount, 5, type: :int32
  field :blockProcessTime, 6, type: Protocol.MetricsInfo.RateInfo
  field :tps, 7, type: Protocol.MetricsInfo.RateInfo
  field :transactionCacheSize, 8, type: :int32
  field :missedTransaction, 9, type: Protocol.MetricsInfo.RateInfo
  field :witnesses, 10, repeated: true, type: Protocol.MetricsInfo.BlockChainInfo.Witness
  field :failProcessBlockNum, 11, type: :int64
  field :failProcessBlockReason, 12, type: :string
  field :dupWitness, 13, repeated: true, type: Protocol.MetricsInfo.BlockChainInfo.DupWitness
end

defmodule Protocol.MetricsInfo.RateInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          count: integer,
          meanRate: float | :infinity | :negative_infinity | :nan,
          oneMinuteRate: float | :infinity | :negative_infinity | :nan,
          fiveMinuteRate: float | :infinity | :negative_infinity | :nan,
          fifteenMinuteRate: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:count, :meanRate, :oneMinuteRate, :fiveMinuteRate, :fifteenMinuteRate]

  field :count, 1, type: :int64
  field :meanRate, 2, type: :double
  field :oneMinuteRate, 3, type: :double
  field :fiveMinuteRate, 4, type: :double
  field :fifteenMinuteRate, 5, type: :double
end

defmodule Protocol.MetricsInfo.NetInfo.ApiInfo.ApiDetailInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          qps: Protocol.MetricsInfo.RateInfo.t() | nil,
          failQps: Protocol.MetricsInfo.RateInfo.t() | nil,
          outTraffic: Protocol.MetricsInfo.RateInfo.t() | nil
        }

  defstruct [:name, :qps, :failQps, :outTraffic]

  field :name, 1, type: :string
  field :qps, 2, type: Protocol.MetricsInfo.RateInfo
  field :failQps, 3, type: Protocol.MetricsInfo.RateInfo
  field :outTraffic, 4, type: Protocol.MetricsInfo.RateInfo
end

defmodule Protocol.MetricsInfo.NetInfo.ApiInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          qps: Protocol.MetricsInfo.RateInfo.t() | nil,
          failQps: Protocol.MetricsInfo.RateInfo.t() | nil,
          outTraffic: Protocol.MetricsInfo.RateInfo.t() | nil,
          detail: [Protocol.MetricsInfo.NetInfo.ApiInfo.ApiDetailInfo.t()]
        }

  defstruct [:qps, :failQps, :outTraffic, :detail]

  field :qps, 1, type: Protocol.MetricsInfo.RateInfo
  field :failQps, 2, type: Protocol.MetricsInfo.RateInfo
  field :outTraffic, 3, type: Protocol.MetricsInfo.RateInfo
  field :detail, 4, repeated: true, type: Protocol.MetricsInfo.NetInfo.ApiInfo.ApiDetailInfo
end

defmodule Protocol.MetricsInfo.NetInfo.DisconnectionDetailInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: String.t(),
          count: integer
        }

  defstruct [:reason, :count]

  field :reason, 1, type: :string
  field :count, 2, type: :int32
end

defmodule Protocol.MetricsInfo.NetInfo.LatencyInfo.LatencyDetailInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          witness: String.t(),
          top99: integer,
          top95: integer,
          top75: integer,
          count: integer,
          delay1S: integer,
          delay2S: integer,
          delay3S: integer
        }

  defstruct [:witness, :top99, :top95, :top75, :count, :delay1S, :delay2S, :delay3S]

  field :witness, 1, type: :string
  field :top99, 2, type: :int32
  field :top95, 3, type: :int32
  field :top75, 4, type: :int32
  field :count, 5, type: :int32
  field :delay1S, 6, type: :int32
  field :delay2S, 7, type: :int32
  field :delay3S, 8, type: :int32
end

defmodule Protocol.MetricsInfo.NetInfo.LatencyInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          top99: integer,
          top95: integer,
          top75: integer,
          totalCount: integer,
          delay1S: integer,
          delay2S: integer,
          delay3S: integer,
          detail: [Protocol.MetricsInfo.NetInfo.LatencyInfo.LatencyDetailInfo.t()]
        }

  defstruct [:top99, :top95, :top75, :totalCount, :delay1S, :delay2S, :delay3S, :detail]

  field :top99, 1, type: :int32
  field :top95, 2, type: :int32
  field :top75, 3, type: :int32
  field :totalCount, 4, type: :int32
  field :delay1S, 5, type: :int32
  field :delay2S, 6, type: :int32
  field :delay3S, 7, type: :int32

  field :detail, 8,
    repeated: true,
    type: Protocol.MetricsInfo.NetInfo.LatencyInfo.LatencyDetailInfo
end

defmodule Protocol.MetricsInfo.NetInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          errorProtoCount: integer,
          api: Protocol.MetricsInfo.NetInfo.ApiInfo.t() | nil,
          connectionCount: integer,
          validConnectionCount: integer,
          tcpInTraffic: Protocol.MetricsInfo.RateInfo.t() | nil,
          tcpOutTraffic: Protocol.MetricsInfo.RateInfo.t() | nil,
          disconnectionCount: integer,
          disconnectionDetail: [Protocol.MetricsInfo.NetInfo.DisconnectionDetailInfo.t()],
          udpInTraffic: Protocol.MetricsInfo.RateInfo.t() | nil,
          udpOutTraffic: Protocol.MetricsInfo.RateInfo.t() | nil,
          latency: Protocol.MetricsInfo.NetInfo.LatencyInfo.t() | nil
        }

  defstruct [
    :errorProtoCount,
    :api,
    :connectionCount,
    :validConnectionCount,
    :tcpInTraffic,
    :tcpOutTraffic,
    :disconnectionCount,
    :disconnectionDetail,
    :udpInTraffic,
    :udpOutTraffic,
    :latency
  ]

  field :errorProtoCount, 1, type: :int32
  field :api, 2, type: Protocol.MetricsInfo.NetInfo.ApiInfo
  field :connectionCount, 3, type: :int32
  field :validConnectionCount, 4, type: :int32
  field :tcpInTraffic, 5, type: Protocol.MetricsInfo.RateInfo
  field :tcpOutTraffic, 6, type: Protocol.MetricsInfo.RateInfo
  field :disconnectionCount, 7, type: :int32

  field :disconnectionDetail, 8,
    repeated: true,
    type: Protocol.MetricsInfo.NetInfo.DisconnectionDetailInfo

  field :udpInTraffic, 9, type: Protocol.MetricsInfo.RateInfo
  field :udpOutTraffic, 10, type: Protocol.MetricsInfo.RateInfo
  field :latency, 11, type: Protocol.MetricsInfo.NetInfo.LatencyInfo
end

defmodule Protocol.MetricsInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          interval: integer,
          node: Protocol.MetricsInfo.NodeInfo.t() | nil,
          blockchain: Protocol.MetricsInfo.BlockChainInfo.t() | nil,
          net: Protocol.MetricsInfo.NetInfo.t() | nil
        }

  defstruct [:interval, :node, :blockchain, :net]

  field :interval, 1, type: :int64
  field :node, 2, type: Protocol.MetricsInfo.NodeInfo
  field :blockchain, 3, type: Protocol.MetricsInfo.BlockChainInfo
  field :net, 4, type: Protocol.MetricsInfo.NetInfo
end

defmodule Protocol.PBFTMessage.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          msg_type: Protocol.PBFTMessage.MsgType.t(),
          data_type: Protocol.PBFTMessage.DataType.t(),
          view_n: integer,
          epoch: integer,
          data: binary
        }

  defstruct [:msg_type, :data_type, :view_n, :epoch, :data]

  field :msg_type, 1, type: Protocol.PBFTMessage.MsgType, enum: true
  field :data_type, 2, type: Protocol.PBFTMessage.DataType, enum: true
  field :view_n, 3, type: :int64
  field :epoch, 4, type: :int64
  field :data, 5, type: :bytes
end

defmodule Protocol.PBFTMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Protocol.PBFTMessage.Raw.t() | nil,
          signature: binary
        }

  defstruct [:raw_data, :signature]

  field :raw_data, 1, type: Protocol.PBFTMessage.Raw
  field :signature, 2, type: :bytes
end

defmodule Protocol.PBFTCommitResult do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          data: binary,
          signature: [binary]
        }

  defstruct [:data, :signature]

  field :data, 1, type: :bytes
  field :signature, 2, repeated: true, type: :bytes
end

defmodule Protocol.SRL do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          srAddress: [binary]
        }

  defstruct [:srAddress]

  field :srAddress, 1, repeated: true, type: :bytes
end
