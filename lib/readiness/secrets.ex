defmodule Readiness.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        Readiness.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:Readiness, :token_signing_secret)
  end
end
