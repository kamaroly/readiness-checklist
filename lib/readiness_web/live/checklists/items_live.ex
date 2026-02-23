defmodule ReadinessWeb.Checklists.ItemsLive do
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

  def mount(_params, _session, socket) do
    socket
    |> assign(:checklist, get_items())
    |> assign(:grouped, group_by_department_and_category())
    |> ok()
  end

  defp group_by_department_and_category() do
    get_items()
    |> Enum.group_by(& &1.category)
    |> Enum.into(%{}, fn {cat, items} ->
      {cat, Enum.group_by(items, & &1.item)}
    end)
  end

  def get_items do
    [
      %{
        department: "Out Patient Department",
        category: "Human Resource",
        item: "Clinicians",
        quantity: 5,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Human Resource",
        item: "Nurses",
        quantity: 4,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Human Resource",
        item: "Ophthalmic assistant",
        quantity: 12,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Equipment",
        item: "Desk Top",
        quantity: 16,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Equipment",
        item: "Lenses",
        quantity: 3,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Equipment",
        item: "Torch",
        quantity: 11,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Equipment",
        item: "Slit Lamp",
        quantity: 7,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Equipment",
        item: "Snellen Chart",
        quantity: 2,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Equipment",
        item: "Indirect Ophthalmoscope",
        quantity: 7,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Equipment",
        item: "Tonometer",
        quantity: nil,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Equipment",
        item: "Printer",
        quantity: 2,
        frequency: "daily"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Cotton Wool",
        quantity: 700,
        frequency: "Thrice Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Clean Gauze Gloves",
        quantity: 700,
        frequency: "Thrice Monthly / week"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Sterile gloves",
        quantity: "3 packets",
        frequency: "Weekly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Hand Sanitizer",
        quantity: 10,
        frequency: "Daily"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Tissue Paper",
        quantity: nil,
        frequency: "Weekly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Fluorescein Strips",
        quantity: 500,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Eye Pads",
        quantity: 200,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Surgical Spirit",
        quantity: "8L",
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Povidone",
        quantity: "500ml",
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Face masks",
        quantity: 100,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Transpore",
        quantity: 6,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Normal Saline",
        quantity: "4L",
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Ringer's Lactate",
        quantity: 2,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Consumables",
        item: "Brown Paper Envelopes",
        quantity: 200,
        frequency: "Weekly"
      },
      %{
        department: "Out Patient Department",
        category: "Drugs",
        item: "Paracaine Eye Drops",
        quantity: 25,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Drugs",
        item: "Tropicamide",
        quantity: 25,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Drugs",
        item: "Artificial Tears",
        quantity: 25,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Drugs",
        item: "Occ. Maxitrol",
        quantity: 2,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Waste Segregation",
        item: "Black Bin - General Waste",
        quantity: 1,
        frequency: "Monthly"
      },
      %{
        department: "Out Patient Department",
        category: "Waste Segregation",
        item: "Yellow Bin - Infectious Waste",
        quantity: 10,
        frequency: "Throughout"
      },
      %{
        department: "Out Patient Department",
        category: "Waste Segregation",
        item: "Red Bin - Highly Infectious Waste",
        quantity: 2,
        frequency: "Throughout"
      },
      %{
        department: "Out Patient Department",
        category: "Waste Segregation",
        item: "Safety Box - Sharps",
        quantity: 10,
        frequency: "Throughout"
      }
    ]
  end
end
