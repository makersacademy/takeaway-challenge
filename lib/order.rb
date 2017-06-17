require_relative './menu.rb'

class Order

  attr_reader :entries, :menu

  def initialize(menu)
    @entries = []
    @menu = menu
  end

  def add_entry(dish_name)
    dish = @menu.get(dish_name)
    @entries << dish
  end
end
