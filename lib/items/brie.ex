defmodule Item.Brie do
  defstruct Item.fields
end

defimpl GildedRose.Update, for: Item.Brie do
  
  def update(item) do
    IO.puts "in brie item"
    %{ item | quality: item.quality + 1 , sell_in: item.sell_in - 1}
  end
    
end