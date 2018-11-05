defmodule Kata do
  @moduledoc """
  Documentation for Kata.
  """

  defmodule Set do
    @typep set() :: maybe_improper_list()

    @spec new() :: set()
    def new do
      []
    end

    @spec add(set(), term()) :: set()
    def add(set, item) do
      cond do
        contains(set, item) -> set
        true -> [item | set]
      end
    end

    @spec size(set()) :: non_neg_integer()
    def size([]) do
      0
    end

    def size([_ | tail]) do
      size(tail) + 1
    end

    @spec isEmpty(set()) :: boolean()
    def isEmpty(set) do
      size(set) == 0
    end

    @spec contains(set(), term()) :: boolean()
    def contains([], _) do
      false
    end

    def contains([head | tail], item) do
      head == item or contains(tail, item)
    end

    @spec remove(set(), term()) :: set()
    def remove([], _) do
      []
    end

    def remove([item | tail], item) do
      tail
    end

    def remove([head | tail], item) do
      [head | remove(tail, item)]
    end
  end

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
