defmodule Item.Regular do
  defstruct Item.fields
end

defimpl GildedRose.Update, for: Item.Regular do
 
  def update(%{ quality: 0} = item ) do
    %{ item | quality: 0 , sell_in: item.sell_in - 1}
  end

  def update(%{ sell_in: sell_in} = item ) when sell_in <= 0 do
    %{ item | quality: item.quality - 2 , sell_in: item.sell_in - 1}
  end


  def update(%{ quality: quality} = item ) when quality >= 50 do
    %{ item | quality: 50 , sell_in: item.sell_in - 1}
  end

  def update(item) do
    %{ item | quality: item.quality - 1 , sell_in: item.sell_in - 1}
  end
    
end