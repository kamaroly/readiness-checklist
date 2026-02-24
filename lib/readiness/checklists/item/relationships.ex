defmodule Readiness.Checklists.Item.Relationships do
  use Spark.Dsl.Fragment, of: Ash.Resource

  relationships do
    belongs_to :area, Readiness.Checklists.Area do
      description "Responsibility area this item belongs to"
      source_attribute :area_id
      destination_attribute :id
      allow_nil? true
    end
  end
end
