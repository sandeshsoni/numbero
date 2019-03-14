defmodule NumberoTest do
  use ExUnit.Case
  doctest Numbero

  test "greets the world" do
    assert Numbero.hello() == :world
  end
end
