defmodule BattleLogWeb.WorkoutControllerTest do
  use BattleLogWeb.ConnCase

  alias BattleLog.Workouts

  @create_attrs %{date: ~N[2010-04-17 14:00:00.000000], name: "some name"}
  @update_attrs %{date: ~N[2011-05-18 15:01:01.000000], name: "some updated name"}
  @invalid_attrs %{date: nil, name: nil}

  def fixture(:workout) do
    {:ok, workout} = Workouts.create_workout(@create_attrs)
    workout
  end

  describe "index" do
    test "lists all workouts", %{conn: conn} do
      conn = get conn, workout_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Workouts"
    end
  end

  describe "new workout" do
    test "renders form", %{conn: conn} do
      conn = get conn, workout_path(conn, :new)
      assert html_response(conn, 200) =~ "New Workout"
    end
  end

  describe "create workout" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, workout_path(conn, :create), workout: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == workout_path(conn, :show, id)

      conn = get conn, workout_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Workout"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, workout_path(conn, :create), workout: @invalid_attrs
      assert html_response(conn, 200) =~ "New Workout"
    end
  end

  describe "edit workout" do
    setup [:create_workout]

    test "renders form for editing chosen workout", %{conn: conn, workout: workout} do
      conn = get conn, workout_path(conn, :edit, workout)
      assert html_response(conn, 200) =~ "Edit Workout"
    end
  end

  describe "update workout" do
    setup [:create_workout]

    test "redirects when data is valid", %{conn: conn, workout: workout} do
      conn = put conn, workout_path(conn, :update, workout), workout: @update_attrs
      assert redirected_to(conn) == workout_path(conn, :show, workout)

      conn = get conn, workout_path(conn, :show, workout)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, workout: workout} do
      conn = put conn, workout_path(conn, :update, workout), workout: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Workout"
    end
  end

  describe "delete workout" do
    setup [:create_workout]

    test "deletes chosen workout", %{conn: conn, workout: workout} do
      conn = delete conn, workout_path(conn, :delete, workout)
      assert redirected_to(conn) == workout_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, workout_path(conn, :show, workout)
      end
    end
  end

  defp create_workout(_) do
    workout = fixture(:workout)
    {:ok, workout: workout}
  end
end