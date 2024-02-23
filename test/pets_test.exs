defmodule PetsTest do
  use ExUnit.Case
  doctest Pets

  test "greets the world" do
    assert Pets.hello() == :world
  end
end
