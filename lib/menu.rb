require_relative 'order'

class Menu
  attr_reader :food

  def initialize
    @food = [
      { name: "Cod", price: 6 },
      { name: "Haddock", price: 6 }, 
      { name: "Plaice", price: 6 }, 
      { name: "Chips", price: 2 },
      { name: "Sausage", price: 3 }
    ]
  end

  def see_menu
    @food 
  end
end
