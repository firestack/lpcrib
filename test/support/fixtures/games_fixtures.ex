defmodule LPCrib.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LPCrib.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        id: "some id"
      })
      |> LPCrib.Games.create_game()

    game
  end
end
