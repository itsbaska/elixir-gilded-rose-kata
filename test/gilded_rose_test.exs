defmodule GildedRoseTest do
  use ExUnit.Case
  import GildedRose

  describe "Aged brie item" do
    @brie %Item{name: "Aged Brie", sell_in: 9, quality: 2}

    test "update an Aged Brie quality" do 
      item = [%{@brie | quality: 3}]
      assert List.first(update_quality(item)).quality == 4
    end
  
    test "quality of an item is never more than 50" do 
      item = [%{@brie | quality: 50 }]      
      assert List.first(update_quality(item)).quality == 50
    end

    test "update Aged Brie sell in" do 
      item = [%{@brie | sell_in: 3 }] 
      assert List.first(update_quality(item)).sell_in == 2
    end
  end

  describe "Regular item" do
    @item %Item{name: "Bread", sell_in: 9, quality: 2}

    test "update an item quality" do 
      item = [%{@item | quality: 3}]
      assert List.first(update_quality(item)).quality == 2
    end
  
    test "quality of an item is never more than 50" do 
      item = [%{@item | quality: 50 }]      
      assert List.first(update_quality(item)).quality == 50
    end

    test "update sell in" do 
      item = [%{@item | sell_in: 3 }] 
      assert List.first(update_quality(item)).sell_in == 2
    end

    test "quality of item degrades twice as fast after sell date" do
      item = [%{@item | quality: 12, sell_in: -3 }]     
      assert List.first(update_quality(item)).quality == 10
    end

    test "quality of an item is never less than 0" do 
      item = [%{@item | quality: 0, sell_in: -3 }]  
      assert List.first(update_quality(item)).quality == 0
    end
  end

  describe "Sulfuras, Hand of Ragnaros" do
    @sulfuras %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 0}

    test "update quality of Sulfuras, Hand of Ragnaros" do
      assert List.first(update_quality([@sulfuras])).quality == 0
    end
    
    test "update sell in of Sulfuras, Hand of Ragnaros" do
      assert List.first(update_quality([@sulfuras])).sell_in == 0
    end
  end

  describe "Backstage passes" do
    @pass %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 2}

    test "update Backstage passes to a TAFKAL80ETC concert -- 5 < sell in < 10 " do 
      assert List.first(update_quality([@pass])).quality == 4
    end
    
    test "update sell_in -- 5 < sell in < 10  " do 
      assert List.first(update_quality([@pass])).sell_in == 8
    end

    test "update Backstage passes to a TAFKAL80ETC concert -- sell in < 5" do 
      item = [%{@pass | quality: 2, sell_in: 5 }]        
      assert List.first(update_quality(item)).quality == 5
    end
    
    test "update sell_in -- sell in < 5" do 
      item = [%{@pass | quality: 2, sell_in: 5 }]        
      assert List.first(update_quality(item)).sell_in == 4
    end
    
    test "update Backstage passes to a TAFKAL80ETC concert -- sell in < 0" do 
      item = [%{@pass | sell_in: - 1 }]        
      assert List.first(update_quality(item)).quality == 0
    end

    test "update sell_in -- sell in < 0" do 
      item = [%{@pass | sell_in: - 1 }]        
      assert List.first(update_quality(item)).sell_in == - 2
    end
  end
end
