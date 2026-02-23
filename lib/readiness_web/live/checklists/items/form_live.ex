defmodule ReadinessWeb.Checklists.Items.FormLive do
  use ReadinessWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <Layouts.app current_user={@current_user} flash={@flash} uri={@uri}>
      <.fieldset>
        <:legend :if={is_nil(@form.data)}>{gettext("New Checklist Item")}</:legend>
        <:legend :if={@form.data}>{gettext("Edit Checklist Item")}</:legend>
        <.form for={@form} phx-change="validate" phx-submit="save-item">
          <.input
            field={@form[:name]}
            label={gettext("Checklist Item Name")}
          />

          <.input
            field={@form[:description]}
            type="textarea"
            label={gettext("Checklist item description")}
          />

          <.button>
            {gettext("Submit")}
          </.button>
        </.form>
      </.fieldset>
    </Layouts.app>
    """
  end

  @impl Phoenix.LiveView
  def mount(%{"item_id" => item_id}, _session, socket) do
    socket
    |> assign(item_id: item_id)
    |> assign_item_form()
    |> ok()
  end

  @impl Phoenix.LiveView
  def handle_event("save-item", %{"form" => params}, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form, params: params) do
      {:ok, item} ->
        socket
        |> put_flash(:info, "Item #{item.name} added to the checklist")
        |> redirect(to: ~p"/checklists/items")
        |> noreply()

      {:error, form} ->
        socket
        |> put_flash(:error, "We could not add the items")
        |> assign(form: form)
        |> noreply()
    end
  end

  defp assign_item_form(socket) do
    assign(socket, form: get_item_form(socket.assigns))
  end

  defp get_item_form(%{item_id: nil, current_user: current_user}) do
    get_new_item_form(current_user)
  end

  defp get_item_form(%{item_id: "new", current_user: current_user}) do
    get_new_item_form(current_user)
  end

  defp get_item_form(%{item_id: item_id, current_user: current_user}) do
    Readiness.Checklists.Item
    |> Ash.get!(item_id, actor: current_user)
    |> AshPhoenix.Form.for_update(:update, actor: current_user)
    |> to_form()
  end

  defp get_new_item_form(current_user) do
    AshPhoenix.Form.for_create(
      Readiness.Checklists.Item,
      :create,
      actor: current_user
    )
    |> to_form()
  end
end
