defmodule Item.Pass do
  defstruct Item.fields
end

defimpl GildedRose.Update, for: Item.Pass do
 
  def update(%{ sell_in: day} = item ) when day > 5 and day < 10 do
    %{ item | quality: item.quality + 2 , sell_in: item.sell_in - 1}
  end

  def update(%{ sell_in: day} = item ) when day <= 5 and day > 1 do
    %{ item | quality: item.quality + 3 , sell_in: item.sell_in - 1}
  end

  
  def update(%{ sell_in: day} = item ) when day <= 0 do
    %{ item | quality: 0 , sell_in: item.sell_in - 1}
  end
  
end