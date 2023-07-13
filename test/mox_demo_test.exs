defmodule MoxDemoTest do
  use ExUnit.Case
  doctest MoxDemo

  test "greets the world" do
    assert MoxDemo.hello() == :world
  end
end
