
class Menu
  attr_reader :items

  CONSTANT_ITEMS =
    [ {name: "Chips", price: 1},
      {name: "Curry", price: 4},
      {name: "Pizza", price: 5},
      {name: "Rice", price: 1},
      {name: "Falafel", price: 3},
    ]
  
  def initialize 
    @items = CONSTANT_ITEMS 
  end

  def item_price(item)
    item[:price]
  end

  
end