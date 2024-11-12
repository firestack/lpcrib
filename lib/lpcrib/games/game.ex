defmodule LPCrib.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "games" do
    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:id])
    |> validate_required([:id])
  end
end
