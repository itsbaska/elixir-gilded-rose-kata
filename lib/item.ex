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
    case item.name do
      "Aged Brie" ->
        Item.Brie
      "Sulfuras, Hand of Ragnaros" ->
        Item.Sulfuras
      "Backstage passes to a TAFKAL80ETC concert" ->
        Item.Pass
      _ ->
        Item.Regular
    end
    
  end
end
