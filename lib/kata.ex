defmodule Kata do
  @moduledoc """
  Documentation for Kata.
  """

  defp beats(:rock, :scissors), do: true
  defp beats(:paper, :rock), do: true
  defp beats(:scissors, :paper), do: true
  defp beats(_, _), do: false

  @valid_moves [:rock, :paper, :scissors]

  @doc """
  #Examples:

      iex> Kata.play(:rock, :scissors)
      :player1Wins

      iex> Kata.play(:paper, :scissors)
      :player2Wins

      iex> Kata.play(:sailboat, :sailboat)
      :invalid

  """

  def play(move, move) when move in @valid_moves, do: :tie

  def play(player1, player2) when player1 in @valid_moves and player2 in @valid_moves do
    if player1 |> beats(player2) do
      :player1Wins
    else
      :player2Wins
    end
  end

  def play(_, _), do: :invalid
end
