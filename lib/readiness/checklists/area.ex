defmodule Readiness.Checklists.Area do
  use Ash.Resource,
    domain: Readiness.Checklists,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Readiness.Checklists.Area.Actions,
      Readiness.Checklists.Area.Attributes,
      Readiness.Checklists.Area.Relationships,
      Readiness.Accounts.Fragments.GlobalPolicies,
      Readiness.Accounts.Fragments.Multitenancies
    ]

  postgres do
    table "checklist_areas"
    repo Readiness.Repo
  end
end
