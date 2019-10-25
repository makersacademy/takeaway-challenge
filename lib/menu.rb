class Menu
  attr_reader :items
  def initialize
    @items = [{name: "Burger", price: 2.00}, {name: "Hot Dog", price: 1.50}]
  end  
end