defmodule KataTest do
  use ExUnit.Case
  doctest Kata

  test "rock vs scissors return player 1 wins" do
    assert Kata.play(:rock, :scissors) == :player1Wins
  end

  test "rock vs paper return player 2 wins" do
    assert Kata.play(:rock, :paper) == :player2Wins
  end

  test "rock vs sailboat return invalid" do
    assert Kata.play(:rock, :sailboat) == :invalidi
  end

  test "rock vs rock return tie" do
    assert Kata.play(:rock, :rock) == :tie
  end

end
