defmodule Item do
  @fields name: nil, sell_in: nil, quality: nil
  defstruct @fields
  def fields, do: @fields
end

defimpl GildedRose.Update, for: Item do
  
  def update(%Item{} = item) do
    item
    |> struct_type
    |> struct(Map.from_struct(item))
    |> GildedRose.Update.update
  end

  def struct_type(%Item{} = item) do
    IO.puts "here"
    IO.inspect item
    case item.name do
      "Aged Brie" ->
        IO.puts "in case"
        # item.quality + 1
        # item.sell_in - 1
        Item.Brie
    end
    
  end
  # def update_item(%Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 0}) do
  #   %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 0}
  # end

  # def update_item(%Item{name: "Aged Brie", quality: 50, sell_in: day}) do
  #   %Item{name: "Aged Brie", sell_in: day - 1, quality: 50}
  # end
  
  # def update_item(%Item{name: "Aged Brie", sell_in: day, quality: quality}) do
  #   %Item{name: "Aged Brie", sell_in: day - 1, quality: quality + 1}
  # end

  # def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day, quality: quality}) when day < 10 and day > 5 do
  #   %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day - 1, quality: quality + 2}
  # end
  
  # def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day, quality: quality}) when day <= 5 and day > 1 do
  #   %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day - 1, quality: quality + 3}
  # end
  
  # def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day, quality: _}) when day <= 0 do
  #   %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: day - 1, quality: 0}
  # end

  # def update_item(%Item{name: name, sell_in: day, quality: 0}) when name != "Aged Brie" do
  #   %Item{name: name, sell_in: day - 1, quality: 0}
  # end

  # def update_item(%Item{name: name, sell_in: day, quality: quality}) when name != "Aged Brie" and day < 0 do
  #   %Item{name: name, sell_in: day - 1, quality: quality - 2}
  # end

  # def update_item(%Item{name: name, sell_in: day, quality: quality}) when name != "Aged Brie" do
  #   %Item{name: name, sell_in: day - 1, quality: quality - 1}
  # end
end
