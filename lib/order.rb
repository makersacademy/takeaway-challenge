require_relative 'menu'

class Order

  attr_reader :items, :menu
  
  def initialize(menu)
    @menu = menu
    @items = {}
  end
  
  def add(dish, quantity)
    items[dish] = quantity
  end
  
  def total
    items.map do |dish, quantity|
      (menu.price(dish)) * (quantity)
    end.inject(:+)
  end
end
