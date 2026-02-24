defmodule Readiness.Checklists.Area.Relationships do
  use Spark.Dsl.Fragment, of: Ash.Resource

  relationships do
    has_many :checklist_items, Readiness.Checklists.Item do
      description "Checklist items for this responsiblity center area"
      destination_attribute :area_id
    end
  end
end
