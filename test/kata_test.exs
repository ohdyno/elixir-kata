defmodule KataTest do
  use ExUnit.Case
  doctest Kata

  test "player 1 wins scenarios" do
    assert Kata.play(:rock, :scissors) == :player1Wins
    assert Kata.play(:scissors, :paper) == :player1Wins
    assert Kata.play(:paper, :rock) == :player1Wins
  end

  test "player 2 wins scenarios" do
    assert Kata.play(:rock, :paper) == :player2Wins
    assert Kata.play(:paper, :scissors) == :player2Wins
    assert Kata.play(:scissors, :rock) == :player2Wins
  end

  test "invalid plays" do
    assert Kata.play(:rock, :sailboat) == :invalid
    assert Kata.play(:invalid, :invalid) == :invalid
  end

  test "tie scenarios" do
    assert Kata.play(:rock, :rock) == :tie
    assert Kata.play(:paper, :paper) == :tie
    assert Kata.play(:scissors, :scissors) == :tie
  end

end
