defmodule LPCrib.Games.Game do
	use LPCrib.Schema
	import Ecto.Changeset

	typed_schema "games" do
		timestamps(type: :utc_datetime_usec)
	end

	@doc false
	def changeset(game, attrs) do
		game
		|> cast(attrs, [:id])
		|> validate_required([:id])
	end
end
