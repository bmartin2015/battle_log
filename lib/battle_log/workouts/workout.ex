defmodule BattleLog.Workouts.Workout do
  use Ecto.Schema
  import Ecto.Changeset
  alias BattleLog.Workouts.Workout


  schema "workouts" do
    field :date, :naive_datetime
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Workout{} = workout, attrs) do
    workout
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
  end
end
