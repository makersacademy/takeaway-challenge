require 'menu'

class Basket

  attr_reader :basket

  def initialize(menu_class = Menu)
    @basket = []
    @menu = menu_class.new
  end

  def show_menu
    @menu.items
  end

  def add_item(dish_choice, amount)
    amount.times { @basket << @menu.get_dish(dish_choice) }
  end

  def total_cost
    @basket.inject(0) { |sum, item| sum + item.price }
  end

end
