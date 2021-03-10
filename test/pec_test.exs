defmodule PecTest do
  use ExUnit.Case
  doctest Pec

  test "greets the world" do
    assert Pec.hello() == :world
  end
end
