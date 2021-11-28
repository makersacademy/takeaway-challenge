require 'menu'

class Order
  attr_reader :summary

  def initialize(restaurant)
    @summary = {}
    @menu = Menu.new(restaurant)
  end

  def add(dish, quantity)
    price = @menu.dishes[dish].to_f * quantity
    @summary[dish] = { quantity: quantity, price: price }
  end
end
