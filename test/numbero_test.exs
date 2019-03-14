defmodule NumberoTest do
  use ExUnit.Case
  doctest Numbero

  test "greets the world" do
    # assert Numbero.hello() == :world
  end


  test "number to combination" do
    assert Number.foo(22) contains "AA"
  end

  test "complete implement 1" do
    assert Number.foo(6686787825) == [
      ["motor", "usual"],
      ["noun", "struck"],
      ["nouns", "truck"],
      ["nouns", "usual"],
      ["onto", "struck"],
      "motortruck"]
  end

end
