defmodule Readiness.Accounts.UserGroup do
  use Ash.Resource,
    domain: Readiness.Accounts,
    data_layer: AshPostgres.DataLayer,
    notifiers: Ash.Notifier.PubSub

  postgres do
    table "user_groups"
    repo Readiness.Repo
  end

  actions do
    default_accept [:user_id, :group_id]
    defaults [:create, :read, :update, :destroy]

    create :sync do
      accept []
      description "Sync user groups"
      argument :user_groups, {:array, :map}, allow_nil?: false
      manual Readiness.Accounts.UserGroup.Changes.SyncUserGroups
    end
  end

  preparations do
    prepare Readiness.Preparations.SetTenant
  end

  changes do
    change Readiness.Changes.SetTenant
  end

  multitenancy do
    strategy :context
  end

  attributes do
    uuid_v7_primary_key :id

    timestamps()
  end

  relationships do
    belongs_to :group, Readiness.Accounts.Group do
      description "Relationshp with a group inside a tenant"
      source_attribute :group_id
      allow_nil? false
    end

    belongs_to :user, Readiness.Accounts.User do
      description "Permission for the user access group"
      source_attribute :user_id
      allow_nil? false
    end
  end

  identities do
    identity :unique_name, [:group_id, :user_id]
  end
end
