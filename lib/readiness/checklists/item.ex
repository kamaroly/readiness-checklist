defmodule Readiness.Checklists.Item do
  use Ash.Resource,
    domain: Readiness.Checklists,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Readiness.Checklists.Item.Actions,
      Readiness.Checklists.Item.Attributes,
      Readiness.Checklists.Item.Relationships,
      Readiness.Accounts.Fragments.GlobalPolicies,
      Readiness.Accounts.Fragments.Multitenancies
    ]

  postgres do
    table "checklist_items"
    repo Readiness.Repo
  end
end
