defmodule Readiness.Accounts do
  use Ash.Domain,
    otp_app: :Readiness

  resources do
    resource Readiness.Accounts.Token
    resource Readiness.Accounts.User
    resource Readiness.Accounts.Team
    resource Readiness.Accounts.UserTeam

    resource Readiness.Accounts.Group
    resource Readiness.Accounts.UserGroup
    resource Readiness.Accounts.GroupPermission

    resource Readiness.Accounts.UserImpersonation
  end
end
