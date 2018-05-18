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

#   def update_item(item) do
#     item = cond do
#       item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" ->
#         if item.quality > 0 do
#           if item.name != "Sulfuras, Hand of Ragnaros" do
#             %{item | quality: item.quality - 1}
#           else
#             item
#           end
#         else
#           item
#         end
#       true ->
#         cond do
#           item.quality < 50 ->
#             item = %{item | quality: item.quality + 1}
#             cond do
#               item.name == "Backstage passes to a TAFKAL80ETC concert" ->
#                 item = cond do
#                   item.sell_in < 11 ->
#                     cond do
#                       item.quality < 50 ->
#                         %{item | quality: item.quality + 1}
#                       true -> item
#                     end
#                   true -> item
#                 end
#                 cond do
#                   item.sell_in < 6 ->
#                     cond do
#                       item.quality < 50 ->
#                         %{item | quality: item.quality + 1}
#                       true -> item
#                     end
#                   true -> item
#                 end
#               true -> item
#             end
#           true -> item
#         end
#     end
#     item = cond do
#       item.name != "Sulfuras, Hand of Ragnaros" ->
#         %{item | sell_in: item.sell_in - 1}
#       true -> item
#     end
#     cond do
#       item.sell_in < 0 ->
#         cond do
#           item.name != "Aged Brie" ->
#             cond do
#               item.name != "Backstage passes to a TAFKAL80ETC concert" ->
#                 cond do
#                   item.quality > 0 ->
#                     cond do
#                       item.name != "Sulfuras, Hand of Ragnaros" ->
#                         %{item | quality: item.quality - 1}
#                       true -> item
#                     end
#                   true -> item
#                 end
#               true -> %{item | quality: item.quality - item.quality}
#             end
#           true ->
#             cond do
#               item.quality < 50 ->
#                 %{item | quality: item.quality + 1}
#               true -> item
#             end
#         end
#       true -> item
#     end
#   end
end
