defmodule Readiness.Checklists.Item.Attributes do
  use Spark.Dsl.Fragment,
    of: Ash.Resource

  attributes do
    uuid_v7_primary_key :id

    attribute :name, :string do
      description "The name of the item on the checklist"
      allow_nil? false
    end

    attribute :description, :string do
      description "More details about this item on the checklist"
      allow_nil? true
    end

    attribute :eheck_frequency, :atom do
      description "How often should this item be checked"
      default :daily
      constraints one_of: [:hourly, :daily, :weekly, :monthly, :quartely, :half_year, :yearly]
    end

    timestamps()
  end
end
