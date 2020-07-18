
class Menu
  attr_reader :items
  
  def initialize
    @items = [
      {name: "chips", price: 1},
      {name: "curry", price: 4},
      {name: "pizza", price: 5},
      {name: "rice", price: 1},
      {name: "falafel", price: 3},
    ]
  end

  def item_price(item)
    item[:price]
  end

  
end