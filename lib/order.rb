require_relative 'menu.rb'

class Order

  attr_reader :dish_order
  attr_accessor :menu 

  def initialize(menu = Menu.new)
    @dish_order = {}
    @menu = menu
  end

  def add(meal, quantity = 1)
    fail "There is no such dish" unless @menu.has_dish(meal)
    @dish_order[meal] = quantity
  end

end
