defmodule Readiness.Checklists do
  use Ash.Domain

  resources do
    resource Readiness.Checklists.Item
  end
end
