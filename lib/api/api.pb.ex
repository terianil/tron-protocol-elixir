defmodule Protocol.Return.ResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :SUCCESS
          | :SIGERROR
          | :CONTRACT_VALIDATE_ERROR
          | :CONTRACT_EXE_ERROR
          | :BANDWITH_ERROR
          | :DUP_TRANSACTION_ERROR
          | :TAPOS_ERROR
          | :TOO_BIG_TRANSACTION_ERROR
          | :TRANSACTION_EXPIRATION_ERROR
          | :SERVER_BUSY
          | :NO_CONNECTION
          | :NOT_ENOUGH_EFFECTIVE_CONNECTION
          | :OTHER_ERROR

  field :SUCCESS, 0

  field :SIGERROR, 1

  field :CONTRACT_VALIDATE_ERROR, 2

  field :CONTRACT_EXE_ERROR, 3

  field :BANDWITH_ERROR, 4

  field :DUP_TRANSACTION_ERROR, 5

  field :TAPOS_ERROR, 6

  field :TOO_BIG_TRANSACTION_ERROR, 7

  field :TRANSACTION_EXPIRATION_ERROR, 8

  field :SERVER_BUSY, 9

  field :NO_CONNECTION, 10

  field :NOT_ENOUGH_EFFECTIVE_CONNECTION, 11

  field :OTHER_ERROR, 20
end

defmodule Protocol.TransactionSignWeight.Result.ResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :ENOUGH_PERMISSION
          | :NOT_ENOUGH_PERMISSION
          | :SIGNATURE_FORMAT_ERROR
          | :COMPUTE_ADDRESS_ERROR
          | :PERMISSION_ERROR
          | :OTHER_ERROR

  field :ENOUGH_PERMISSION, 0

  field :NOT_ENOUGH_PERMISSION, 1

  field :SIGNATURE_FORMAT_ERROR, 2

  field :COMPUTE_ADDRESS_ERROR, 3

  field :PERMISSION_ERROR, 4

  field :OTHER_ERROR, 20
end

defmodule Protocol.TransactionApprovedList.Result.ResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :SUCCESS | :SIGNATURE_FORMAT_ERROR | :COMPUTE_ADDRESS_ERROR | :OTHER_ERROR

  field :SUCCESS, 0

  field :SIGNATURE_FORMAT_ERROR, 1

  field :COMPUTE_ADDRESS_ERROR, 2

  field :OTHER_ERROR, 20
end

defmodule Protocol.Return do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: boolean,
          code: Protocol.Return.ResponseCode.t(),
          message: binary
        }

  defstruct [:result, :code, :message]

  field :result, 1, type: :bool
  field :code, 2, type: Protocol.Return.ResponseCode, enum: true
  field :message, 3, type: :bytes
end

defmodule Protocol.BlockReference do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block_num: integer,
          block_hash: binary
        }

  defstruct [:block_num, :block_hash]

  field :block_num, 1, type: :int64
  field :block_hash, 2, type: :bytes
end

defmodule Protocol.WitnessList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          witnesses: [Protocol.Witness.t()]
        }

  defstruct [:witnesses]

  field :witnesses, 1, repeated: true, type: Protocol.Witness
end

defmodule Protocol.ProposalList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          proposals: [Protocol.Proposal.t()]
        }

  defstruct [:proposals]

  field :proposals, 1, repeated: true, type: Protocol.Proposal
end

defmodule Protocol.ExchangeList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          exchanges: [Protocol.Exchange.t()]
        }

  defstruct [:exchanges]

  field :exchanges, 1, repeated: true, type: Protocol.Exchange
end

defmodule Protocol.AssetIssueList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          assetIssue: [Protocol.AssetIssueContract.t()]
        }

  defstruct [:assetIssue]

  field :assetIssue, 1, repeated: true, type: Protocol.AssetIssueContract
end

defmodule Protocol.BlockList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block: [Protocol.Block.t()]
        }

  defstruct [:block]

  field :block, 1, repeated: true, type: Protocol.Block
end

defmodule Protocol.TransactionList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: [Protocol.Transaction.t()]
        }

  defstruct [:transaction]

  field :transaction, 1, repeated: true, type: Protocol.Transaction
end

defmodule Protocol.TransactionIdList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txId: [String.t()]
        }

  defstruct [:txId]

  field :txId, 1, repeated: true, type: :string
end

defmodule Protocol.DelegatedResourceMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fromAddress: binary,
          toAddress: binary
        }

  defstruct [:fromAddress, :toAddress]

  field :fromAddress, 1, type: :bytes
  field :toAddress, 2, type: :bytes
end

defmodule Protocol.DelegatedResourceList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          delegatedResource: [Protocol.DelegatedResource.t()]
        }

  defstruct [:delegatedResource]

  field :delegatedResource, 1, repeated: true, type: Protocol.DelegatedResource
end

defmodule Protocol.NodeList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          nodes: [Protocol.Node.t()]
        }

  defstruct [:nodes]

  field :nodes, 1, repeated: true, type: Protocol.Node
end

defmodule Protocol.Node do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: Protocol.Address.t() | nil
        }

  defstruct [:address]

  field :address, 1, type: Protocol.Address
end

defmodule Protocol.Address do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host: binary,
          port: integer
        }

  defstruct [:host, :port]

  field :host, 1, type: :bytes
  field :port, 2, type: :int32
end

defmodule Protocol.EmptyMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Protocol.NumberMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          num: integer
        }

  defstruct [:num]

  field :num, 1, type: :int64
end

defmodule Protocol.BytesMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: binary
        }

  defstruct [:value]

  field :value, 1, type: :bytes
end

defmodule Protocol.TimeMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          beginInMilliseconds: integer,
          endInMilliseconds: integer
        }

  defstruct [:beginInMilliseconds, :endInMilliseconds]

  field :beginInMilliseconds, 1, type: :int64
  field :endInMilliseconds, 2, type: :int64
end

defmodule Protocol.BlockLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          startNum: integer,
          endNum: integer
        }

  defstruct [:startNum, :endNum]

  field :startNum, 1, type: :int64
  field :endNum, 2, type: :int64
end

defmodule Protocol.TransactionLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactionId: binary,
          limitNum: integer
        }

  defstruct [:transactionId, :limitNum]

  field :transactionId, 1, type: :bytes
  field :limitNum, 2, type: :int64
end

defmodule Protocol.AccountPaginated do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account: Protocol.Account.t() | nil,
          offset: integer,
          limit: integer
        }

  defstruct [:account, :offset, :limit]

  field :account, 1, type: Protocol.Account
  field :offset, 2, type: :int64
  field :limit, 3, type: :int64
end

defmodule Protocol.TimePaginatedMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timeMessage: Protocol.TimeMessage.t() | nil,
          offset: integer,
          limit: integer
        }

  defstruct [:timeMessage, :offset, :limit]

  field :timeMessage, 1, type: Protocol.TimeMessage
  field :offset, 2, type: :int64
  field :limit, 3, type: :int64
end

defmodule Protocol.AccountNetMessage.AssetNetUsedEntry do
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

defmodule Protocol.AccountNetMessage.AssetNetLimitEntry do
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

defmodule Protocol.AccountNetMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          freeNetUsed: integer,
          freeNetLimit: integer,
          NetUsed: integer,
          NetLimit: integer,
          assetNetUsed: %{String.t() => integer},
          assetNetLimit: %{String.t() => integer},
          TotalNetLimit: integer,
          TotalNetWeight: integer
        }

  defstruct [
    :freeNetUsed,
    :freeNetLimit,
    :NetUsed,
    :NetLimit,
    :assetNetUsed,
    :assetNetLimit,
    :TotalNetLimit,
    :TotalNetWeight
  ]

  field :freeNetUsed, 1, type: :int64
  field :freeNetLimit, 2, type: :int64
  field :NetUsed, 3, type: :int64
  field :NetLimit, 4, type: :int64

  field :assetNetUsed, 5,
    repeated: true,
    type: Protocol.AccountNetMessage.AssetNetUsedEntry,
    map: true

  field :assetNetLimit, 6,
    repeated: true,
    type: Protocol.AccountNetMessage.AssetNetLimitEntry,
    map: true

  field :TotalNetLimit, 7, type: :int64
  field :TotalNetWeight, 8, type: :int64
end

defmodule Protocol.AccountResourceMessage.AssetNetUsedEntry do
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

defmodule Protocol.AccountResourceMessage.AssetNetLimitEntry do
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

defmodule Protocol.AccountResourceMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          freeNetUsed: integer,
          freeNetLimit: integer,
          NetUsed: integer,
          NetLimit: integer,
          assetNetUsed: %{String.t() => integer},
          assetNetLimit: %{String.t() => integer},
          TotalNetLimit: integer,
          TotalNetWeight: integer,
          TotalTronPowerWeight: integer,
          tronPowerUsed: integer,
          tronPowerLimit: integer,
          EnergyUsed: integer,
          EnergyLimit: integer,
          TotalEnergyLimit: integer,
          TotalEnergyWeight: integer,
          storageUsed: integer,
          storageLimit: integer
        }

  defstruct [
    :freeNetUsed,
    :freeNetLimit,
    :NetUsed,
    :NetLimit,
    :assetNetUsed,
    :assetNetLimit,
    :TotalNetLimit,
    :TotalNetWeight,
    :TotalTronPowerWeight,
    :tronPowerUsed,
    :tronPowerLimit,
    :EnergyUsed,
    :EnergyLimit,
    :TotalEnergyLimit,
    :TotalEnergyWeight,
    :storageUsed,
    :storageLimit
  ]

  field :freeNetUsed, 1, type: :int64
  field :freeNetLimit, 2, type: :int64
  field :NetUsed, 3, type: :int64
  field :NetLimit, 4, type: :int64

  field :assetNetUsed, 5,
    repeated: true,
    type: Protocol.AccountResourceMessage.AssetNetUsedEntry,
    map: true

  field :assetNetLimit, 6,
    repeated: true,
    type: Protocol.AccountResourceMessage.AssetNetLimitEntry,
    map: true

  field :TotalNetLimit, 7, type: :int64
  field :TotalNetWeight, 8, type: :int64
  field :TotalTronPowerWeight, 9, type: :int64
  field :tronPowerUsed, 10, type: :int64
  field :tronPowerLimit, 11, type: :int64
  field :EnergyUsed, 13, type: :int64
  field :EnergyLimit, 14, type: :int64
  field :TotalEnergyLimit, 15, type: :int64
  field :TotalEnergyWeight, 16, type: :int64
  field :storageUsed, 21, type: :int64
  field :storageLimit, 22, type: :int64
end

defmodule Protocol.PaginatedMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          offset: integer,
          limit: integer
        }

  defstruct [:offset, :limit]

  field :offset, 1, type: :int64
  field :limit, 2, type: :int64
end

defmodule Protocol.EasyTransferMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          passPhrase: binary,
          toAddress: binary,
          amount: integer
        }

  defstruct [:passPhrase, :toAddress, :amount]

  field :passPhrase, 1, type: :bytes
  field :toAddress, 2, type: :bytes
  field :amount, 3, type: :int64
end

defmodule Protocol.EasyTransferAssetMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          passPhrase: binary,
          toAddress: binary,
          assetId: String.t(),
          amount: integer
        }

  defstruct [:passPhrase, :toAddress, :assetId, :amount]

  field :passPhrase, 1, type: :bytes
  field :toAddress, 2, type: :bytes
  field :assetId, 3, type: :string
  field :amount, 4, type: :int64
end

defmodule Protocol.EasyTransferByPrivateMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          privateKey: binary,
          toAddress: binary,
          amount: integer
        }

  defstruct [:privateKey, :toAddress, :amount]

  field :privateKey, 1, type: :bytes
  field :toAddress, 2, type: :bytes
  field :amount, 3, type: :int64
end

defmodule Protocol.EasyTransferAssetByPrivateMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          privateKey: binary,
          toAddress: binary,
          assetId: String.t(),
          amount: integer
        }

  defstruct [:privateKey, :toAddress, :assetId, :amount]

  field :privateKey, 1, type: :bytes
  field :toAddress, 2, type: :bytes
  field :assetId, 3, type: :string
  field :amount, 4, type: :int64
end

defmodule Protocol.EasyTransferResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Protocol.Transaction.t() | nil,
          result: Protocol.Return.t() | nil,
          txid: binary
        }

  defstruct [:transaction, :result, :txid]

  field :transaction, 1, type: Protocol.Transaction
  field :result, 2, type: Protocol.Return
  field :txid, 3, type: :bytes
end

defmodule Protocol.AddressPrKeyPairMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          privateKey: String.t()
        }

  defstruct [:address, :privateKey]

  field :address, 1, type: :string
  field :privateKey, 2, type: :string
end

defmodule Protocol.TransactionExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Protocol.Transaction.t() | nil,
          txid: binary,
          constant_result: [binary],
          result: Protocol.Return.t() | nil,
          energy_used: integer
        }

  defstruct [:transaction, :txid, :constant_result, :result, :energy_used]

  field :transaction, 1, type: Protocol.Transaction
  field :txid, 2, type: :bytes
  field :constant_result, 3, repeated: true, type: :bytes
  field :result, 4, type: Protocol.Return
  field :energy_used, 5, type: :int64
end

defmodule Protocol.BlockExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Protocol.TransactionExtention.t()],
          block_header: Protocol.BlockHeader.t() | nil,
          blockid: binary
        }

  defstruct [:transactions, :block_header, :blockid]

  field :transactions, 1, repeated: true, type: Protocol.TransactionExtention
  field :block_header, 2, type: Protocol.BlockHeader
  field :blockid, 3, type: :bytes
end

defmodule Protocol.BlockListExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block: [Protocol.BlockExtention.t()]
        }

  defstruct [:block]

  field :block, 1, repeated: true, type: Protocol.BlockExtention
end

defmodule Protocol.TransactionListExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: [Protocol.TransactionExtention.t()]
        }

  defstruct [:transaction]

  field :transaction, 1, repeated: true, type: Protocol.TransactionExtention
end

defmodule Protocol.BlockIncrementalMerkleTree do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          number: integer,
          merkleTree: Protocol.IncrementalMerkleTree.t() | nil
        }

  defstruct [:number, :merkleTree]

  field :number, 1, type: :int64
  field :merkleTree, 2, type: Protocol.IncrementalMerkleTree
end

defmodule Protocol.TransactionSignWeight.Result do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          code: Protocol.TransactionSignWeight.Result.ResponseCode.t(),
          message: String.t()
        }

  defstruct [:code, :message]

  field :code, 1, type: Protocol.TransactionSignWeight.Result.ResponseCode, enum: true
  field :message, 2, type: :string
end

defmodule Protocol.TransactionSignWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          permission: Protocol.Permission.t() | nil,
          approved_list: [binary],
          current_weight: integer,
          result: Protocol.TransactionSignWeight.Result.t() | nil,
          transaction: Protocol.TransactionExtention.t() | nil
        }

  defstruct [:permission, :approved_list, :current_weight, :result, :transaction]

  field :permission, 1, type: Protocol.Permission
  field :approved_list, 2, repeated: true, type: :bytes
  field :current_weight, 3, type: :int64
  field :result, 4, type: Protocol.TransactionSignWeight.Result
  field :transaction, 5, type: Protocol.TransactionExtention
end

defmodule Protocol.TransactionApprovedList.Result do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          code: Protocol.TransactionApprovedList.Result.ResponseCode.t(),
          message: String.t()
        }

  defstruct [:code, :message]

  field :code, 1, type: Protocol.TransactionApprovedList.Result.ResponseCode, enum: true
  field :message, 2, type: :string
end

defmodule Protocol.TransactionApprovedList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          approved_list: [binary],
          result: Protocol.TransactionApprovedList.Result.t() | nil,
          transaction: Protocol.TransactionExtention.t() | nil
        }

  defstruct [:approved_list, :result, :transaction]

  field :approved_list, 2, repeated: true, type: :bytes
  field :result, 4, type: Protocol.TransactionApprovedList.Result
  field :transaction, 5, type: Protocol.TransactionExtention
end

defmodule Protocol.IvkDecryptParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start_block_index: integer,
          end_block_index: integer,
          ivk: binary
        }

  defstruct [:start_block_index, :end_block_index, :ivk]

  field :start_block_index, 1, type: :int64
  field :end_block_index, 2, type: :int64
  field :ivk, 3, type: :bytes
end

defmodule Protocol.IvkDecryptAndMarkParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start_block_index: integer,
          end_block_index: integer,
          ivk: binary,
          ak: binary,
          nk: binary
        }

  defstruct [:start_block_index, :end_block_index, :ivk, :ak, :nk]

  field :start_block_index, 1, type: :int64
  field :end_block_index, 2, type: :int64
  field :ivk, 5, type: :bytes
  field :ak, 3, type: :bytes
  field :nk, 4, type: :bytes
end

defmodule Protocol.OvkDecryptParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start_block_index: integer,
          end_block_index: integer,
          ovk: binary
        }

  defstruct [:start_block_index, :end_block_index, :ovk]

  field :start_block_index, 1, type: :int64
  field :end_block_index, 2, type: :int64
  field :ovk, 3, type: :bytes
end

defmodule Protocol.DecryptNotes.NoteTx do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          note: Protocol.Note.t() | nil,
          txid: binary,
          index: integer
        }

  defstruct [:note, :txid, :index]

  field :note, 1, type: Protocol.Note
  field :txid, 2, type: :bytes
  field :index, 3, type: :int32
end

defmodule Protocol.DecryptNotes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          noteTxs: [Protocol.DecryptNotes.NoteTx.t()]
        }

  defstruct [:noteTxs]

  field :noteTxs, 1, repeated: true, type: Protocol.DecryptNotes.NoteTx
end

defmodule Protocol.DecryptNotesMarked.NoteTx do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          note: Protocol.Note.t() | nil,
          txid: binary,
          index: integer,
          is_spend: boolean
        }

  defstruct [:note, :txid, :index, :is_spend]

  field :note, 1, type: Protocol.Note
  field :txid, 2, type: :bytes
  field :index, 3, type: :int32
  field :is_spend, 4, type: :bool
end

defmodule Protocol.DecryptNotesMarked do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          noteTxs: [Protocol.DecryptNotesMarked.NoteTx.t()]
        }

  defstruct [:noteTxs]

  field :noteTxs, 1, repeated: true, type: Protocol.DecryptNotesMarked.NoteTx
end

defmodule Protocol.Note do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: integer,
          payment_address: String.t(),
          rcm: binary,
          memo: binary
        }

  defstruct [:value, :payment_address, :rcm, :memo]

  field :value, 1, type: :int64
  field :payment_address, 2, type: :string
  field :rcm, 3, type: :bytes
  field :memo, 4, type: :bytes
end

defmodule Protocol.SpendNote do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          note: Protocol.Note.t() | nil,
          alpha: binary,
          voucher: Protocol.IncrementalMerkleVoucher.t() | nil,
          path: binary
        }

  defstruct [:note, :alpha, :voucher, :path]

  field :note, 3, type: Protocol.Note
  field :alpha, 4, type: :bytes
  field :voucher, 5, type: Protocol.IncrementalMerkleVoucher
  field :path, 6, type: :bytes
end

defmodule Protocol.ReceiveNote do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          note: Protocol.Note.t() | nil
        }

  defstruct [:note]

  field :note, 1, type: Protocol.Note
end

defmodule Protocol.PrivateParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transparent_from_address: binary,
          ask: binary,
          nsk: binary,
          ovk: binary,
          from_amount: integer,
          shielded_spends: [Protocol.SpendNote.t()],
          shielded_receives: [Protocol.ReceiveNote.t()],
          transparent_to_address: binary,
          to_amount: integer,
          timeout: integer
        }

  defstruct [
    :transparent_from_address,
    :ask,
    :nsk,
    :ovk,
    :from_amount,
    :shielded_spends,
    :shielded_receives,
    :transparent_to_address,
    :to_amount,
    :timeout
  ]

  field :transparent_from_address, 1, type: :bytes
  field :ask, 2, type: :bytes
  field :nsk, 3, type: :bytes
  field :ovk, 4, type: :bytes
  field :from_amount, 5, type: :int64
  field :shielded_spends, 6, repeated: true, type: Protocol.SpendNote
  field :shielded_receives, 7, repeated: true, type: Protocol.ReceiveNote
  field :transparent_to_address, 8, type: :bytes
  field :to_amount, 9, type: :int64
  field :timeout, 10, type: :int64
end

defmodule Protocol.PrivateParametersWithoutAsk do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transparent_from_address: binary,
          ak: binary,
          nsk: binary,
          ovk: binary,
          from_amount: integer,
          shielded_spends: [Protocol.SpendNote.t()],
          shielded_receives: [Protocol.ReceiveNote.t()],
          transparent_to_address: binary,
          to_amount: integer,
          timeout: integer
        }

  defstruct [
    :transparent_from_address,
    :ak,
    :nsk,
    :ovk,
    :from_amount,
    :shielded_spends,
    :shielded_receives,
    :transparent_to_address,
    :to_amount,
    :timeout
  ]

  field :transparent_from_address, 1, type: :bytes
  field :ak, 2, type: :bytes
  field :nsk, 3, type: :bytes
  field :ovk, 4, type: :bytes
  field :from_amount, 5, type: :int64
  field :shielded_spends, 6, repeated: true, type: Protocol.SpendNote
  field :shielded_receives, 7, repeated: true, type: Protocol.ReceiveNote
  field :transparent_to_address, 8, type: :bytes
  field :to_amount, 9, type: :int64
  field :timeout, 10, type: :int64
end

defmodule Protocol.SpendAuthSigParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ask: binary,
          tx_hash: binary,
          alpha: binary
        }

  defstruct [:ask, :tx_hash, :alpha]

  field :ask, 1, type: :bytes
  field :tx_hash, 2, type: :bytes
  field :alpha, 3, type: :bytes
end

defmodule Protocol.NfParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          note: Protocol.Note.t() | nil,
          voucher: Protocol.IncrementalMerkleVoucher.t() | nil,
          ak: binary,
          nk: binary
        }

  defstruct [:note, :voucher, :ak, :nk]

  field :note, 1, type: Protocol.Note
  field :voucher, 2, type: Protocol.IncrementalMerkleVoucher
  field :ak, 3, type: :bytes
  field :nk, 4, type: :bytes
end

defmodule Protocol.ExpandedSpendingKeyMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ask: binary,
          nsk: binary,
          ovk: binary
        }

  defstruct [:ask, :nsk, :ovk]

  field :ask, 1, type: :bytes
  field :nsk, 2, type: :bytes
  field :ovk, 3, type: :bytes
end

defmodule Protocol.ViewingKeyMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ak: binary,
          nk: binary
        }

  defstruct [:ak, :nk]

  field :ak, 1, type: :bytes
  field :nk, 2, type: :bytes
end

defmodule Protocol.IncomingViewingKeyMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ivk: binary
        }

  defstruct [:ivk]

  field :ivk, 1, type: :bytes
end

defmodule Protocol.DiversifierMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          d: binary
        }

  defstruct [:d]

  field :d, 1, type: :bytes
end

defmodule Protocol.IncomingViewingKeyDiversifierMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ivk: Protocol.IncomingViewingKeyMessage.t() | nil,
          d: Protocol.DiversifierMessage.t() | nil
        }

  defstruct [:ivk, :d]

  field :ivk, 1, type: Protocol.IncomingViewingKeyMessage
  field :d, 2, type: Protocol.DiversifierMessage
end

defmodule Protocol.PaymentAddressMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          d: Protocol.DiversifierMessage.t() | nil,
          pkD: binary,
          payment_address: String.t()
        }

  defstruct [:d, :pkD, :payment_address]

  field :d, 1, type: Protocol.DiversifierMessage
  field :pkD, 2, type: :bytes
  field :payment_address, 3, type: :string
end

defmodule Protocol.ShieldedAddressInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sk: binary,
          ask: binary,
          nsk: binary,
          ovk: binary,
          ak: binary,
          nk: binary,
          ivk: binary,
          d: binary,
          pkD: binary,
          payment_address: String.t()
        }

  defstruct [:sk, :ask, :nsk, :ovk, :ak, :nk, :ivk, :d, :pkD, :payment_address]

  field :sk, 1, type: :bytes
  field :ask, 2, type: :bytes
  field :nsk, 3, type: :bytes
  field :ovk, 4, type: :bytes
  field :ak, 5, type: :bytes
  field :nk, 6, type: :bytes
  field :ivk, 7, type: :bytes
  field :d, 8, type: :bytes
  field :pkD, 9, type: :bytes
  field :payment_address, 10, type: :string
end

defmodule Protocol.NoteParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ak: binary,
          nk: binary,
          note: Protocol.Note.t() | nil,
          txid: binary,
          index: integer
        }

  defstruct [:ak, :nk, :note, :txid, :index]

  field :ak, 1, type: :bytes
  field :nk, 2, type: :bytes
  field :note, 3, type: Protocol.Note
  field :txid, 4, type: :bytes
  field :index, 5, type: :int32
end

defmodule Protocol.SpendResult do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: boolean,
          message: String.t()
        }

  defstruct [:result, :message]

  field :result, 1, type: :bool
  field :message, 2, type: :string
end

defmodule Protocol.TransactionInfoList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactionInfo: [Protocol.TransactionInfo.t()]
        }

  defstruct [:transactionInfo]

  field :transactionInfo, 1, repeated: true, type: Protocol.TransactionInfo
end

defmodule Protocol.SpendNoteTRC20 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          note: Protocol.Note.t() | nil,
          alpha: binary,
          root: binary,
          path: binary,
          pos: integer
        }

  defstruct [:note, :alpha, :root, :path, :pos]

  field :note, 1, type: Protocol.Note
  field :alpha, 2, type: :bytes
  field :root, 3, type: :bytes
  field :path, 4, type: :bytes
  field :pos, 5, type: :int64
end

defmodule Protocol.PrivateShieldedTRC20Parameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ask: binary,
          nsk: binary,
          ovk: binary,
          from_amount: String.t(),
          shielded_spends: [Protocol.SpendNoteTRC20.t()],
          shielded_receives: [Protocol.ReceiveNote.t()],
          transparent_to_address: binary,
          to_amount: String.t(),
          shielded_TRC20_contract_address: binary
        }

  defstruct [
    :ask,
    :nsk,
    :ovk,
    :from_amount,
    :shielded_spends,
    :shielded_receives,
    :transparent_to_address,
    :to_amount,
    :shielded_TRC20_contract_address
  ]

  field :ask, 1, type: :bytes
  field :nsk, 2, type: :bytes
  field :ovk, 3, type: :bytes
  field :from_amount, 4, type: :string
  field :shielded_spends, 5, repeated: true, type: Protocol.SpendNoteTRC20
  field :shielded_receives, 6, repeated: true, type: Protocol.ReceiveNote
  field :transparent_to_address, 7, type: :bytes
  field :to_amount, 8, type: :string
  field :shielded_TRC20_contract_address, 9, type: :bytes
end

defmodule Protocol.PrivateShieldedTRC20ParametersWithoutAsk do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ak: binary,
          nsk: binary,
          ovk: binary,
          from_amount: String.t(),
          shielded_spends: [Protocol.SpendNoteTRC20.t()],
          shielded_receives: [Protocol.ReceiveNote.t()],
          transparent_to_address: binary,
          to_amount: String.t(),
          shielded_TRC20_contract_address: binary
        }

  defstruct [
    :ak,
    :nsk,
    :ovk,
    :from_amount,
    :shielded_spends,
    :shielded_receives,
    :transparent_to_address,
    :to_amount,
    :shielded_TRC20_contract_address
  ]

  field :ak, 1, type: :bytes
  field :nsk, 2, type: :bytes
  field :ovk, 3, type: :bytes
  field :from_amount, 4, type: :string
  field :shielded_spends, 5, repeated: true, type: Protocol.SpendNoteTRC20
  field :shielded_receives, 6, repeated: true, type: Protocol.ReceiveNote
  field :transparent_to_address, 7, type: :bytes
  field :to_amount, 8, type: :string
  field :shielded_TRC20_contract_address, 9, type: :bytes
end

defmodule Protocol.ShieldedTRC20Parameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          spend_description: [Protocol.SpendDescription.t()],
          receive_description: [Protocol.ReceiveDescription.t()],
          binding_signature: binary,
          message_hash: binary,
          trigger_contract_input: String.t(),
          parameter_type: String.t()
        }

  defstruct [
    :spend_description,
    :receive_description,
    :binding_signature,
    :message_hash,
    :trigger_contract_input,
    :parameter_type
  ]

  field :spend_description, 1, repeated: true, type: Protocol.SpendDescription
  field :receive_description, 2, repeated: true, type: Protocol.ReceiveDescription
  field :binding_signature, 3, type: :bytes
  field :message_hash, 4, type: :bytes
  field :trigger_contract_input, 5, type: :string
  field :parameter_type, 6, type: :string
end

defmodule Protocol.IvkDecryptTRC20Parameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start_block_index: integer,
          end_block_index: integer,
          shielded_TRC20_contract_address: binary,
          ivk: binary,
          ak: binary,
          nk: binary,
          events: [String.t()]
        }

  defstruct [
    :start_block_index,
    :end_block_index,
    :shielded_TRC20_contract_address,
    :ivk,
    :ak,
    :nk,
    :events
  ]

  field :start_block_index, 1, type: :int64
  field :end_block_index, 2, type: :int64
  field :shielded_TRC20_contract_address, 3, type: :bytes
  field :ivk, 4, type: :bytes
  field :ak, 5, type: :bytes
  field :nk, 6, type: :bytes
  field :events, 7, repeated: true, type: :string
end

defmodule Protocol.OvkDecryptTRC20Parameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start_block_index: integer,
          end_block_index: integer,
          ovk: binary,
          shielded_TRC20_contract_address: binary,
          events: [String.t()]
        }

  defstruct [
    :start_block_index,
    :end_block_index,
    :ovk,
    :shielded_TRC20_contract_address,
    :events
  ]

  field :start_block_index, 1, type: :int64
  field :end_block_index, 2, type: :int64
  field :ovk, 3, type: :bytes
  field :shielded_TRC20_contract_address, 4, type: :bytes
  field :events, 5, repeated: true, type: :string
end

defmodule Protocol.DecryptNotesTRC20.NoteTx do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          note: Protocol.Note.t() | nil,
          position: integer,
          is_spent: boolean,
          txid: binary,
          index: integer,
          to_amount: String.t(),
          transparent_to_address: binary
        }

  defstruct [:note, :position, :is_spent, :txid, :index, :to_amount, :transparent_to_address]

  field :note, 1, type: Protocol.Note
  field :position, 2, type: :int64
  field :is_spent, 3, type: :bool
  field :txid, 4, type: :bytes
  field :index, 5, type: :int32
  field :to_amount, 6, type: :string
  field :transparent_to_address, 7, type: :bytes
end

defmodule Protocol.DecryptNotesTRC20 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          noteTxs: [Protocol.DecryptNotesTRC20.NoteTx.t()]
        }

  defstruct [:noteTxs]

  field :noteTxs, 1, repeated: true, type: Protocol.DecryptNotesTRC20.NoteTx
end

defmodule Protocol.NfTRC20Parameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          note: Protocol.Note.t() | nil,
          ak: binary,
          nk: binary,
          position: integer,
          shielded_TRC20_contract_address: binary
        }

  defstruct [:note, :ak, :nk, :position, :shielded_TRC20_contract_address]

  field :note, 1, type: Protocol.Note
  field :ak, 2, type: :bytes
  field :nk, 3, type: :bytes
  field :position, 4, type: :int64
  field :shielded_TRC20_contract_address, 5, type: :bytes
end

defmodule Protocol.NullifierResult do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          is_spent: boolean
        }

  defstruct [:is_spent]

  field :is_spent, 1, type: :bool
end

defmodule Protocol.ShieldedTRC20TriggerContractParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          shielded_TRC20_Parameters: Protocol.ShieldedTRC20Parameters.t() | nil,
          spend_authority_signature: [Protocol.BytesMessage.t()],
          amount: String.t(),
          transparent_to_address: binary
        }

  defstruct [
    :shielded_TRC20_Parameters,
    :spend_authority_signature,
    :amount,
    :transparent_to_address
  ]

  field :shielded_TRC20_Parameters, 1, type: Protocol.ShieldedTRC20Parameters
  field :spend_authority_signature, 2, repeated: true, type: Protocol.BytesMessage
  field :amount, 3, type: :string
  field :transparent_to_address, 4, type: :bytes
end

defmodule Protocol.Wallet.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Wallet"

  rpc :GetAccount, Protocol.Account, Protocol.Account

  rpc :GetAccountById, Protocol.Account, Protocol.Account

  rpc :GetAccountBalance, Protocol.AccountBalanceRequest, Protocol.AccountBalanceResponse

  rpc :GetBlockBalanceTrace,
      Protocol.BlockBalanceTrace.BlockIdentifier,
      Protocol.BlockBalanceTrace

  rpc :CreateTransaction, Protocol.TransferContract, Protocol.Transaction

  rpc :CreateTransaction2, Protocol.TransferContract, Protocol.TransactionExtention

  rpc :BroadcastTransaction, Protocol.Transaction, Protocol.Return

  rpc :UpdateAccount, Protocol.AccountUpdateContract, Protocol.Transaction

  rpc :SetAccountId, Protocol.SetAccountIdContract, Protocol.Transaction

  rpc :UpdateAccount2, Protocol.AccountUpdateContract, Protocol.TransactionExtention

  rpc :VoteWitnessAccount, Protocol.VoteWitnessContract, Protocol.Transaction

  rpc :UpdateSetting, Protocol.UpdateSettingContract, Protocol.TransactionExtention

  rpc :UpdateEnergyLimit, Protocol.UpdateEnergyLimitContract, Protocol.TransactionExtention

  rpc :VoteWitnessAccount2, Protocol.VoteWitnessContract, Protocol.TransactionExtention

  rpc :CreateAssetIssue, Protocol.AssetIssueContract, Protocol.Transaction

  rpc :CreateAssetIssue2, Protocol.AssetIssueContract, Protocol.TransactionExtention

  rpc :UpdateWitness, Protocol.WitnessUpdateContract, Protocol.Transaction

  rpc :UpdateWitness2, Protocol.WitnessUpdateContract, Protocol.TransactionExtention

  rpc :CreateAccount, Protocol.AccountCreateContract, Protocol.Transaction

  rpc :CreateAccount2, Protocol.AccountCreateContract, Protocol.TransactionExtention

  rpc :CreateWitness, Protocol.WitnessCreateContract, Protocol.Transaction

  rpc :CreateWitness2, Protocol.WitnessCreateContract, Protocol.TransactionExtention

  rpc :TransferAsset, Protocol.TransferAssetContract, Protocol.Transaction

  rpc :TransferAsset2, Protocol.TransferAssetContract, Protocol.TransactionExtention

  rpc :ParticipateAssetIssue, Protocol.ParticipateAssetIssueContract, Protocol.Transaction

  rpc :ParticipateAssetIssue2,
      Protocol.ParticipateAssetIssueContract,
      Protocol.TransactionExtention

  rpc :FreezeBalance, Protocol.FreezeBalanceContract, Protocol.Transaction

  rpc :FreezeBalance2, Protocol.FreezeBalanceContract, Protocol.TransactionExtention

  rpc :UnfreezeBalance, Protocol.UnfreezeBalanceContract, Protocol.Transaction

  rpc :UnfreezeBalance2, Protocol.UnfreezeBalanceContract, Protocol.TransactionExtention

  rpc :UnfreezeAsset, Protocol.UnfreezeAssetContract, Protocol.Transaction

  rpc :UnfreezeAsset2, Protocol.UnfreezeAssetContract, Protocol.TransactionExtention

  rpc :WithdrawBalance, Protocol.WithdrawBalanceContract, Protocol.Transaction

  rpc :WithdrawBalance2, Protocol.WithdrawBalanceContract, Protocol.TransactionExtention

  rpc :UpdateAsset, Protocol.UpdateAssetContract, Protocol.Transaction

  rpc :UpdateAsset2, Protocol.UpdateAssetContract, Protocol.TransactionExtention

  rpc :ProposalCreate, Protocol.ProposalCreateContract, Protocol.TransactionExtention

  rpc :ProposalApprove, Protocol.ProposalApproveContract, Protocol.TransactionExtention

  rpc :ProposalDelete, Protocol.ProposalDeleteContract, Protocol.TransactionExtention

  rpc :BuyStorage, Protocol.BuyStorageContract, Protocol.TransactionExtention

  rpc :BuyStorageBytes, Protocol.BuyStorageBytesContract, Protocol.TransactionExtention

  rpc :SellStorage, Protocol.SellStorageContract, Protocol.TransactionExtention

  rpc :ExchangeCreate, Protocol.ExchangeCreateContract, Protocol.TransactionExtention

  rpc :ExchangeInject, Protocol.ExchangeInjectContract, Protocol.TransactionExtention

  rpc :ExchangeWithdraw, Protocol.ExchangeWithdrawContract, Protocol.TransactionExtention

  rpc :ExchangeTransaction, Protocol.ExchangeTransactionContract, Protocol.TransactionExtention

  rpc :MarketSellAsset, Protocol.MarketSellAssetContract, Protocol.TransactionExtention

  rpc :MarketCancelOrder, Protocol.MarketCancelOrderContract, Protocol.TransactionExtention

  rpc :GetMarketOrderById, Protocol.BytesMessage, Protocol.MarketOrder

  rpc :GetMarketOrderByAccount, Protocol.BytesMessage, Protocol.MarketOrderList

  rpc :GetMarketPriceByPair, Protocol.MarketOrderPair, Protocol.MarketPriceList

  rpc :GetMarketOrderListByPair, Protocol.MarketOrderPair, Protocol.MarketOrderList

  rpc :GetMarketPairList, Protocol.EmptyMessage, Protocol.MarketOrderPairList

  rpc :ListNodes, Protocol.EmptyMessage, Protocol.NodeList

  rpc :GetAssetIssueByAccount, Protocol.Account, Protocol.AssetIssueList

  rpc :GetAccountNet, Protocol.Account, Protocol.AccountNetMessage

  rpc :GetAccountResource, Protocol.Account, Protocol.AccountResourceMessage

  rpc :GetAssetIssueByName, Protocol.BytesMessage, Protocol.AssetIssueContract

  rpc :GetAssetIssueListByName, Protocol.BytesMessage, Protocol.AssetIssueList

  rpc :GetAssetIssueById, Protocol.BytesMessage, Protocol.AssetIssueContract

  rpc :GetNowBlock, Protocol.EmptyMessage, Protocol.Block

  rpc :GetNowBlock2, Protocol.EmptyMessage, Protocol.BlockExtention

  rpc :GetBlockByNum, Protocol.NumberMessage, Protocol.Block

  rpc :GetBlockByNum2, Protocol.NumberMessage, Protocol.BlockExtention

  rpc :GetTransactionCountByBlockNum, Protocol.NumberMessage, Protocol.NumberMessage

  rpc :GetBlockById, Protocol.BytesMessage, Protocol.Block

  rpc :GetBlockByLimitNext, Protocol.BlockLimit, Protocol.BlockList

  rpc :GetBlockByLimitNext2, Protocol.BlockLimit, Protocol.BlockListExtention

  rpc :GetBlockByLatestNum, Protocol.NumberMessage, Protocol.BlockList

  rpc :GetBlockByLatestNum2, Protocol.NumberMessage, Protocol.BlockListExtention

  rpc :GetTransactionById, Protocol.BytesMessage, Protocol.Transaction

  rpc :DeployContract, Protocol.CreateSmartContract, Protocol.TransactionExtention

  rpc :GetContract, Protocol.BytesMessage, Protocol.SmartContract

  rpc :GetContractInfo, Protocol.BytesMessage, Protocol.SmartContractDataWrapper

  rpc :TriggerContract, Protocol.TriggerSmartContract, Protocol.TransactionExtention

  rpc :TriggerConstantContract, Protocol.TriggerSmartContract, Protocol.TransactionExtention

  rpc :ClearContractABI, Protocol.ClearABIContract, Protocol.TransactionExtention

  rpc :ListWitnesses, Protocol.EmptyMessage, Protocol.WitnessList

  rpc :GetDelegatedResource, Protocol.DelegatedResourceMessage, Protocol.DelegatedResourceList

  rpc :GetDelegatedResourceAccountIndex,
      Protocol.BytesMessage,
      Protocol.DelegatedResourceAccountIndex

  rpc :ListProposals, Protocol.EmptyMessage, Protocol.ProposalList

  rpc :GetPaginatedProposalList, Protocol.PaginatedMessage, Protocol.ProposalList

  rpc :GetProposalById, Protocol.BytesMessage, Protocol.Proposal

  rpc :ListExchanges, Protocol.EmptyMessage, Protocol.ExchangeList

  rpc :GetPaginatedExchangeList, Protocol.PaginatedMessage, Protocol.ExchangeList

  rpc :GetExchangeById, Protocol.BytesMessage, Protocol.Exchange

  rpc :GetChainParameters, Protocol.EmptyMessage, Protocol.ChainParameters

  rpc :GetAssetIssueList, Protocol.EmptyMessage, Protocol.AssetIssueList

  rpc :GetPaginatedAssetIssueList, Protocol.PaginatedMessage, Protocol.AssetIssueList

  rpc :TotalTransaction, Protocol.EmptyMessage, Protocol.NumberMessage

  rpc :GetNextMaintenanceTime, Protocol.EmptyMessage, Protocol.NumberMessage

  rpc :GetTransactionSign, Protocol.TransactionSign, Protocol.Transaction

  rpc :GetTransactionSign2, Protocol.TransactionSign, Protocol.TransactionExtention

  rpc :CreateAddress, Protocol.BytesMessage, Protocol.BytesMessage

  rpc :EasyTransferAsset, Protocol.EasyTransferAssetMessage, Protocol.EasyTransferResponse

  rpc :EasyTransferAssetByPrivate,
      Protocol.EasyTransferAssetByPrivateMessage,
      Protocol.EasyTransferResponse

  rpc :EasyTransfer, Protocol.EasyTransferMessage, Protocol.EasyTransferResponse

  rpc :EasyTransferByPrivate, Protocol.EasyTransferByPrivateMessage, Protocol.EasyTransferResponse

  rpc :GenerateAddress, Protocol.EmptyMessage, Protocol.AddressPrKeyPairMessage

  rpc :GetTransactionInfoById, Protocol.BytesMessage, Protocol.TransactionInfo

  rpc :AccountPermissionUpdate,
      Protocol.AccountPermissionUpdateContract,
      Protocol.TransactionExtention

  rpc :AddSign, Protocol.TransactionSign, Protocol.TransactionExtention

  rpc :GetTransactionSignWeight, Protocol.Transaction, Protocol.TransactionSignWeight

  rpc :GetTransactionApprovedList, Protocol.Transaction, Protocol.TransactionApprovedList

  rpc :GetNodeInfo, Protocol.EmptyMessage, Protocol.NodeInfo

  rpc :GetRewardInfo, Protocol.BytesMessage, Protocol.NumberMessage

  rpc :GetBrokerageInfo, Protocol.BytesMessage, Protocol.NumberMessage

  rpc :UpdateBrokerage, Protocol.UpdateBrokerageContract, Protocol.TransactionExtention

  rpc :CreateShieldedTransaction, Protocol.PrivateParameters, Protocol.TransactionExtention

  rpc :GetMerkleTreeVoucherInfo, Protocol.OutputPointInfo, Protocol.IncrementalMerkleVoucherInfo

  rpc :ScanNoteByIvk, Protocol.IvkDecryptParameters, Protocol.DecryptNotes

  rpc :ScanAndMarkNoteByIvk, Protocol.IvkDecryptAndMarkParameters, Protocol.DecryptNotesMarked

  rpc :ScanNoteByOvk, Protocol.OvkDecryptParameters, Protocol.DecryptNotes

  rpc :GetSpendingKey, Protocol.EmptyMessage, Protocol.BytesMessage

  rpc :GetExpandedSpendingKey, Protocol.BytesMessage, Protocol.ExpandedSpendingKeyMessage

  rpc :GetAkFromAsk, Protocol.BytesMessage, Protocol.BytesMessage

  rpc :GetNkFromNsk, Protocol.BytesMessage, Protocol.BytesMessage

  rpc :GetIncomingViewingKey, Protocol.ViewingKeyMessage, Protocol.IncomingViewingKeyMessage

  rpc :GetDiversifier, Protocol.EmptyMessage, Protocol.DiversifierMessage

  rpc :GetNewShieldedAddress, Protocol.EmptyMessage, Protocol.ShieldedAddressInfo

  rpc :GetZenPaymentAddress,
      Protocol.IncomingViewingKeyDiversifierMessage,
      Protocol.PaymentAddressMessage

  rpc :GetRcm, Protocol.EmptyMessage, Protocol.BytesMessage

  rpc :IsSpend, Protocol.NoteParameters, Protocol.SpendResult

  rpc :CreateShieldedTransactionWithoutSpendAuthSig,
      Protocol.PrivateParametersWithoutAsk,
      Protocol.TransactionExtention

  rpc :GetShieldTransactionHash, Protocol.Transaction, Protocol.BytesMessage

  rpc :CreateSpendAuthSig, Protocol.SpendAuthSigParameters, Protocol.BytesMessage

  rpc :CreateShieldNullifier, Protocol.NfParameters, Protocol.BytesMessage

  rpc :CreateShieldedContractParameters,
      Protocol.PrivateShieldedTRC20Parameters,
      Protocol.ShieldedTRC20Parameters

  rpc :CreateShieldedContractParametersWithoutAsk,
      Protocol.PrivateShieldedTRC20ParametersWithoutAsk,
      Protocol.ShieldedTRC20Parameters

  rpc :ScanShieldedTRC20NotesByIvk, Protocol.IvkDecryptTRC20Parameters, Protocol.DecryptNotesTRC20

  rpc :ScanShieldedTRC20NotesByOvk, Protocol.OvkDecryptTRC20Parameters, Protocol.DecryptNotesTRC20

  rpc :IsShieldedTRC20ContractNoteSpent, Protocol.NfTRC20Parameters, Protocol.NullifierResult

  rpc :GetTriggerInputForShieldedTRC20Contract,
      Protocol.ShieldedTRC20TriggerContractParameters,
      Protocol.BytesMessage

  rpc :CreateCommonTransaction, Protocol.Transaction, Protocol.TransactionExtention

  rpc :GetTransactionInfoByBlockNum, Protocol.NumberMessage, Protocol.TransactionInfoList

  rpc :GetBurnTrx, Protocol.EmptyMessage, Protocol.NumberMessage

  rpc :GetTransactionFromPending, Protocol.BytesMessage, Protocol.Transaction

  rpc :GetTransactionListFromPending, Protocol.EmptyMessage, Protocol.TransactionIdList

  rpc :GetPendingSize, Protocol.EmptyMessage, Protocol.NumberMessage
end

defmodule Protocol.Wallet.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.Wallet.Service
end

defmodule Protocol.WalletSolidity.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.WalletSolidity"

  rpc :GetAccount, Protocol.Account, Protocol.Account

  rpc :GetAccountById, Protocol.Account, Protocol.Account

  rpc :ListWitnesses, Protocol.EmptyMessage, Protocol.WitnessList

  rpc :GetAssetIssueList, Protocol.EmptyMessage, Protocol.AssetIssueList

  rpc :GetPaginatedAssetIssueList, Protocol.PaginatedMessage, Protocol.AssetIssueList

  rpc :GetAssetIssueByName, Protocol.BytesMessage, Protocol.AssetIssueContract

  rpc :GetAssetIssueListByName, Protocol.BytesMessage, Protocol.AssetIssueList

  rpc :GetAssetIssueById, Protocol.BytesMessage, Protocol.AssetIssueContract

  rpc :GetNowBlock, Protocol.EmptyMessage, Protocol.Block

  rpc :GetNowBlock2, Protocol.EmptyMessage, Protocol.BlockExtention

  rpc :GetBlockByNum, Protocol.NumberMessage, Protocol.Block

  rpc :GetBlockByNum2, Protocol.NumberMessage, Protocol.BlockExtention

  rpc :GetTransactionCountByBlockNum, Protocol.NumberMessage, Protocol.NumberMessage

  rpc :GetDelegatedResource, Protocol.DelegatedResourceMessage, Protocol.DelegatedResourceList

  rpc :GetDelegatedResourceAccountIndex,
      Protocol.BytesMessage,
      Protocol.DelegatedResourceAccountIndex

  rpc :GetExchangeById, Protocol.BytesMessage, Protocol.Exchange

  rpc :ListExchanges, Protocol.EmptyMessage, Protocol.ExchangeList

  rpc :GetTransactionById, Protocol.BytesMessage, Protocol.Transaction

  rpc :GetTransactionInfoById, Protocol.BytesMessage, Protocol.TransactionInfo

  rpc :GenerateAddress, Protocol.EmptyMessage, Protocol.AddressPrKeyPairMessage

  rpc :GetMerkleTreeVoucherInfo, Protocol.OutputPointInfo, Protocol.IncrementalMerkleVoucherInfo

  rpc :ScanNoteByIvk, Protocol.IvkDecryptParameters, Protocol.DecryptNotes

  rpc :ScanAndMarkNoteByIvk, Protocol.IvkDecryptAndMarkParameters, Protocol.DecryptNotesMarked

  rpc :ScanNoteByOvk, Protocol.OvkDecryptParameters, Protocol.DecryptNotes

  rpc :IsSpend, Protocol.NoteParameters, Protocol.SpendResult

  rpc :ScanShieldedTRC20NotesByIvk, Protocol.IvkDecryptTRC20Parameters, Protocol.DecryptNotesTRC20

  rpc :ScanShieldedTRC20NotesByOvk, Protocol.OvkDecryptTRC20Parameters, Protocol.DecryptNotesTRC20

  rpc :IsShieldedTRC20ContractNoteSpent, Protocol.NfTRC20Parameters, Protocol.NullifierResult

  rpc :GetRewardInfo, Protocol.BytesMessage, Protocol.NumberMessage

  rpc :GetBrokerageInfo, Protocol.BytesMessage, Protocol.NumberMessage

  rpc :TriggerConstantContract, Protocol.TriggerSmartContract, Protocol.TransactionExtention

  rpc :GetTransactionInfoByBlockNum, Protocol.NumberMessage, Protocol.TransactionInfoList

  rpc :GetMarketOrderById, Protocol.BytesMessage, Protocol.MarketOrder

  rpc :GetMarketOrderByAccount, Protocol.BytesMessage, Protocol.MarketOrderList

  rpc :GetMarketPriceByPair, Protocol.MarketOrderPair, Protocol.MarketPriceList

  rpc :GetMarketOrderListByPair, Protocol.MarketOrderPair, Protocol.MarketOrderList

  rpc :GetMarketPairList, Protocol.EmptyMessage, Protocol.MarketOrderPairList

  rpc :GetBurnTrx, Protocol.EmptyMessage, Protocol.NumberMessage
end

defmodule Protocol.WalletSolidity.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.WalletSolidity.Service
end

defmodule Protocol.WalletExtension.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.WalletExtension"

  rpc :GetTransactionsFromThis, Protocol.AccountPaginated, Protocol.TransactionList

  rpc :GetTransactionsFromThis2, Protocol.AccountPaginated, Protocol.TransactionListExtention

  rpc :GetTransactionsToThis, Protocol.AccountPaginated, Protocol.TransactionList

  rpc :GetTransactionsToThis2, Protocol.AccountPaginated, Protocol.TransactionListExtention
end

defmodule Protocol.WalletExtension.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.WalletExtension.Service
end

defmodule Protocol.Database.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Database"

  rpc :getBlockReference, Protocol.EmptyMessage, Protocol.BlockReference

  rpc :GetDynamicProperties, Protocol.EmptyMessage, Protocol.DynamicProperties

  rpc :GetNowBlock, Protocol.EmptyMessage, Protocol.Block

  rpc :GetBlockByNum, Protocol.NumberMessage, Protocol.Block
end

defmodule Protocol.Database.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.Database.Service
end

defmodule Protocol.Monitor.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Monitor"

  rpc :GetStatsInfo, Protocol.EmptyMessage, Protocol.MetricsInfo
end

defmodule Protocol.Monitor.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.Monitor.Service
end

defmodule Protocol.Network.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Network"
end

defmodule Protocol.Network.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.Network.Service
end
