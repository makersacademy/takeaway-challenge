class Menu
  attr_reader :menu

  def initialize
    @menu = [{ :item_no => 1, :name => "Moluccan Margherita", :price => 6 },
    { :item_no => 2, :name => "Conure Caramelised Onion and Goats Cheese", :price => 8 },
    { :item_no => 3, :name => "Macaw Mushroom", :price => 7 },
    { :item_no => 4, :name => "Fischer's Four Cheese", :price => 8 },
    { :item_no => 5, :name => "Blue Fronted Cheese and Roasted Potato", :price => 8 },
    { :item_no => 6, :name => "Chattering Cheesy Dough Balls", :price => 3 },
    { :item_no => 7, :name => "Ducorps Dough Balls", :price => 2.5 }]
  end

end
