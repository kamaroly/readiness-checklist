defmodule ReadinessWeb.Checklists.ItemsLive do
  use ReadinessWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <Layouts.app current_user={@current_user} flash={@flash} uri={@uri}>
      <Cinder.Table.table
        resource={Readiness.Checklists.Item}
        actor={@current_user}
        row_click={fn item -> JS.navigate(~p"/checklists/items/#{item.id}") end}
      >
        <:col :let={item} label={gettext("Item Name")}>{item.name}</:col>
        <:col :let={item} label={gettext("Description")}>{item.description}</:col>
      </Cinder.Table.table>
    </Layouts.app>
    """
  end
end
