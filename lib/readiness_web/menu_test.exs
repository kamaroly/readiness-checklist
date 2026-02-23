defmodule ReadinessWeb.MenuTest do
  use ReadinessWeb.ConnCase

  describe "Menu module" do
    test "left_menu/0 module returns an array" do
      user = create_user()
      assert is_list(ReadinessWeb.Menu.left_menu(user))
    end
  end
end
