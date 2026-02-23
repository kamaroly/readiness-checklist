defmodule ReadinessWeb.CoreComponents.AshFormTest do
  use ReadinessWeb.ConnCase

  describe "Ash Form" do
    test "Form can be rendered" do
      _assigns = %{
        id: Ash.UUIDv7.generate(),
        resource: Readiness.Members.Member,
        actor: %{},
        tenant: "test",
        authorize?: false
      }
    end
  end
end
