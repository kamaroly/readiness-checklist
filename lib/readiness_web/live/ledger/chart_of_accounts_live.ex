defmodule ReadinessWeb.Ledger.ChartOfAccountsLive do
  use ReadinessWeb, :live_view

  on_mount {ReadinessWeb.LiveUserAuth, :live_user_required}
  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <Layouts.ledger flash={@flash} current_user={@current_user} uri={@uri}>
      <Cinder.Table.table resource={Readiness.Ledger.Account} actor={@current_user}>
        <:col :let={account} field="identifer" label="Code" filter>{account.identifier}</:col>
        <:col :let={account} field="name" label="Name">{account.name}</:col>
        <:col :let={account} field="currency" label="currency">{account.currency}</:col>
        <:col :let={account} field="nature" label="Nature">{account.nature}</:col>
      </Cinder.Table.table>
    </Layouts.ledger>
    """
  end
end
