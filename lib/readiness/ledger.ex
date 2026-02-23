defmodule Readiness.Ledger do
  use Ash.Domain,
    otp_app: :Readiness

  resources do
    resource Readiness.Ledger.Account
    resource Readiness.Ledger.Balance
    resource Readiness.Ledger.Transfer
  end
end
