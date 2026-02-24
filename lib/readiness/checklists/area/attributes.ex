defmodule Readiness.Checklists.Area.Attributes do
  use Spark.Dsl.Fragment,
    of: Ash.Resource

  attributes do
    uuid_v7_primary_key :id

    attribute :name, :string do
      description "The name of the responsibility area with checklist"
      allow_nil? false
    end

    attribute :description, :string do
      description "More info about the responsibility area"
      allow_nil? true
    end

    timestamps()
  end
end
