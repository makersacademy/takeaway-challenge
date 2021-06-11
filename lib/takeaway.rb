require_relative 'menu'

class Takeaway
  attr_reader :order

  @@menu = Menu.new

  def initialize
  @order = []
  end

  def add_dish(dish)
    fail "Dish not on menu!" if !@@menu.dishes.key?(dish)
    @order << dish
  end

end