defmodule KataTest do
  use ExUnit.Case
  alias Kata.Set, as: Set

  setup do
    empty = Set.new()
    one = Set.new() |> Set.add("a")
    many = Set.new() |> Set.add("a") |> Set.add("b")

    {:ok, empty: empty, one: one, many: many}
  end

  test "emptiness", %{empty: empty, one: one, many: many} do
    assert (empty |> Set.isEmpty()) == true
    assert (one |> Set.isEmpty()) == false
    assert (many |> Set.isEmpty()) == false
  end

  test "size", %{empty: empty, one: one, many: many} do
    assert (empty |> Set.size()) == 0
    assert (one |> Set.size()) == 1
    assert (many |> Set.size()) > 1
  end

  test "contains", %{empty: empty, one: one, many: many} do
    assert empty |> Set.contains("a") == false
    assert one |> Set.contains("a") == true
    assert one |> Set.contains("b") == false
    assert many |> Set.contains("a") == true
    assert many |> Set.contains("b") == true
  end

  test "remove" do
    set = Set.new() |> Set.add("a") |> Set.add("b") |> Set.add("c")
    originalSize = set |> Set.size()

    result = set |> Set.remove("a")

    assert result |> Set.size() == originalSize - 1
    assert result |> Set.contains("a") == false
  end

  test "remove an item that does not exist", %{one: one} do
    result = one |> Set.remove("an item that does not exist")

    assert result |> Set.size() == 1
  end

  test "ignores duplicates", %{one: one} do
    result = one |> Set.add("a")

    assert result |> Set.size() == 1
  end
end
