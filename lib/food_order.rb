require_relative './takeaway_menu'

class FoodOrder

  attr_reader :food_order

  def initialize
    @food_order = []
    @menu = Menu.new
  end

  def add_item(food, number)
    raise "This menu item does not exist" if @menu.menu[food].nil?

    menu_item = @menu.menu.select { |key, _value| key == food }
    number.times { @food_order << menu_item }
    @food_order
  end

end
