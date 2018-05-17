defmodule GildedRoseTest do
  use ExUnit.Case

  test "updates an item" do
    assert GildedRose.update_quality([%Item{name: "bread", sell_in: 9, quality: 2}]) == [%Item{name: "bread", sell_in: 8, quality: 1}]
  end

  test "update an Aged Brie" do 
    assert GildedRose.update_quality([%Item{name: "Aged Brie", sell_in: 9, quality: 2}]) == [%Item{name: "Aged Brie", sell_in: 8, quality: 3}]
  end

  test "update Backstage passes to a TAFKAL80ETC concert -- sell in < 10 > 5" do 
    assert GildedRose.update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 2}]) == [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 8, quality: 4}]
  end

  test "update Backstage passes to a TAFKAL80ETC concert -- sell in < 5" do 
    assert GildedRose.update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 2}]) == [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 4, quality: 5}]
  end

  test "update Backstage passes to a TAFKAL80ETC concert -- sell in < 0" do 
    assert GildedRose.update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 0, quality: 3}]) == [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: -1, quality: 0}]
  end

end
