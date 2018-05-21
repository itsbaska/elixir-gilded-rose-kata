defmodule Item.Brie do
  defstruct Item.fields
end

defimpl GildedRose.Update, for: Item.Brie do
  
  def update(%{ quality: quality} = item ) when quality >= 50 do
    %{ item | quality: 50 , sell_in: item.sell_in - 1}
  end

  def update(item) do
    %{ item | quality: item.quality + 1 , sell_in: item.sell_in - 1}
  end

    # def update_item(%Item{name: "Aged Brie", quality: 50, sell_in: day}) do
  #   %Item{name: "Aged Brie", sell_in: day - 1, quality: 50}
  # end
  
  # def update_item(%Item{name: "Aged Brie", sell_in: day, quality: quality}) do
  #   %Item{name: "Aged Brie", sell_in: day - 1, quality: quality + 1}
  # end

    
end