defmodule GildedRose do
  # Example
  # update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 1}])
  # => [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 8, quality: 3}]

  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(%Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 0}) do
    %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 0}
  end

  def update_item(%Item{name: "Aged Brie", quality: 50, sell_in: day}) do
    %Item{name: "Aged Brie", sell_in: day - 1, quality: 50}
  end
  
  def update_item(%Item{name: "Aged Brie", sell_in: day, quality: quality}) do
    %Item{name: "Aged Brie", sell_in: day - 1, quality: quality + 1}
  end

  def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day, quality: quality}) when day < 10 and day > 5 do
    %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day - 1, quality: quality + 2}
  end
  
  def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day, quality: quality}) when day <= 5 and day > 1 do
    %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day - 1, quality: quality + 3}
  end
  
  def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day, quality: _}) when day <= 0 do
    %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day - 1, quality: 0}
  end

  def update_item(%Item{name: name, sell_in: day, quality: 0}) when name != "Aged Brie" do
    %Item{name: name, sell_in: day - 1, quality: 0}
  end

  def update_item(%Item{name: name, sell_in: day, quality: quality}) when name != "Aged Brie" and day < 0 do
    %Item{name: name, sell_in: day - 1, quality: quality - 2}
  end

  def update_item(%Item{name: name, sell_in: day, quality: quality}) when name != "Aged Brie" do
    %Item{name: name, sell_in: day - 1, quality: quality - 1}
  end
end
