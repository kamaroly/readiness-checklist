defmodule ReadinessWeb.Helpers do
  alias Readiness.Accounts.User

  @doc """
  Confirms if a user is a among super users
  """
  @spec is_super_user?(User.t()) :: boolean()
  def is_super_user?(user) do
    super_users = Application.get_env(:Readiness, :super_users, [])
    to_string(user.email) in super_users
  end

  @doc """
  Confirm if the users is impersonative
  """
  @spec impersonated?(User.t()) :: boolean()
  def impersonated?(user), do: Map.get(user, :impersonated?, false)
end
