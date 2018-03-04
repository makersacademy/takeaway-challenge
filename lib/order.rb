require_relative 'menu.rb'

class Order
  attr_reader :basket
  def initialize(basket = {})
    @basket = basket
  end

  def add_dish(number, quantity = 1)
    @basket[(Menu.new.dishes[number]).first] =
    [Menu.new.dishes[number].last, quantity]
    @basket
  end


end
