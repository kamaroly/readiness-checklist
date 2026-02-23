defmodule Readiness.Accounts.Fragments.Multitenancies do
  use Spark.Dsl.Fragment, of: Ash.Resource

  preparations do
    prepare Readiness.Preparations.SetTenant
  end

  changes do
    change Readiness.Changes.SetTenant
  end

  multitenancy do
    strategy :context
  end
end
