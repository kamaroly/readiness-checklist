defmodule ReadinessWeb.Checklists.RunnerLive do
  use ReadinessWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <Layouts.app current_user={@current_user} flash={@flash} uri={@uri}>
      <.fieldset>
        <:legend>{gettext("Equipments")}</:legend>

        <.input
          type="checkbox"
          name="form[item_name]"
          label={gettext("Clinicians x 5")}
          class="checkbox-primary"
        />
        <.input
          type="checkbox"
          name="form[item_name]"
          label={gettext("Nurses x 4")}
          class="checkbox-primary"
        />

        <.input
          type="checkbox"
          name="form[item_name]"
          label={gettext("Item 1")}
          class="checkbox-primary"
        />
      </.fieldset>

      <.fieldset>
        <:legend>{gettext("Consumables")}</:legend>

        <.input
          type="checkbox"
          name="form[item_name]"
          label={gettext("Item 1")}
          class="checkbox-primary"
        />
        <.input
          type="checkbox"
          name="form[item_name]"
          label={gettext("Item 1")}
          class="checkbox-primary"
        />

        <.input
          type="checkbox"
          name="form[item_name]"
          label={gettext("Item 1")}
          class="checkbox-primary"
        />
      </.fieldset>

      <div class="mt-6 text-sm opacity-70 flex flex-wrap gap-3">
        <div class="badge badge-success badge-outline">Daily</div>
        <div class="badge badge-warning badge-outline">Weekly</div>
        <div class="badge badge-info badge-outline">Monthly</div>
        <div class="badge badge-error badge-outline">Throughout</div>
      </div>
    </Layouts.app>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket
    |> ok()
  end
end
