require 'menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add(food, quantity = 1)
    basket[food] += quantity
  end

  def remove(food)
    basket.include?(food) ? basket.delete(food) : "Item not in basket"
  end
  
  def total
    total = 0
    basket.each do |item, quantity|
      price = @menu.menu[item]
      total += price * quantity
    end
    total
  end
end