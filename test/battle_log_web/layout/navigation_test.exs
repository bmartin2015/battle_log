defmodule BattleLogWeb.NavigationTest do
  use BattleLogWeb.ConnCase, async: true
  import BattleLog.Factory  # Add this line
  
  test "shows a sign in with Google link when not signed in", %{conn: conn} do
    conn = get conn, "/"
    
    assert html_response(conn, 200) =~ "Sign in with Google"
  end

  test "shows a sign out link when signed in", %{conn: conn} do
    user = insert(:user)

    conn = conn
    |> assign(:user, user)
    |> get("/")
    
    assert html_response(conn, 200) =~ "Sign out"
  end

  test "shows a link to the workout index", %{conn: conn} do
    conn = get conn, "/"

    assert html_response(conn, 200) =~ "<a href=\"/workouts\">Workouts</a>"
  end

  test "shows a link to add workout for a signed in user", %{conn: conn} do
    user = insert(:user)

    conn = conn
    |> assign(:user, user)
    |> get("/")

    assert html_response(conn, 200) =~ "<a href=\"/workouts/new\">Add Workout</a>"
  end
end