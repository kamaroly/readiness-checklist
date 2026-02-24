defmodule Readiness.Checklists do
  use Ash.Domain

  resources do
    resource Readiness.Checklists.Item
    resource Readiness.Checklists.Area
  end
end
