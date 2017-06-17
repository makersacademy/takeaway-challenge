require "./lib/menu.rb"

class Order

  attr_reader :basket, :menu

  def initialize
    @basket = []
    @selection = {}
  end

  def add_dish(dish, quantity)
    raise "Dish not available. Please see menu for options." if !Menu::DISHES.include?(dish)
    @selection = {dish => quantity}
    @basket << @selection
    return "#{quantity} x #{dish}(s) added to your basket."
  end


end
