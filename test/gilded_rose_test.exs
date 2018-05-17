defmodule GildedRoseTest do
  use ExUnit.Case

  test "updates an item sell-in date" do
    assert GildedRose.update_quality([%Item{name: "bread", sell_in: 9, quality: 2}]) == [%Item{name: "bread", sell_in: 8, quality: 1}]
  end
end
