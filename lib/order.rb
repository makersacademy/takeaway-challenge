require_relative 'menu'

class Order
NOT_ON_MENU_ERROR = 'This is not on the menu'

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def select_dish(item, quantity = 1)
    fail NOT_ON_MENU_ERROR unless available?(item)
    quantity.times { @basket[item] += @menu.dishes[item] }
  end

  def remove_dish(item, quantity = 1)
    fail NOT_ON_MENU_ERROR if !@menu.dishes.include?(item)
    quantity.times { @basket[item] -= @menu.dishes[item] }
  end

  def calculate_total
    @basket.values.reduce(:+)
  end

  private

  def available?(item)
    @menu.dishes.has_key?(item)
  end
end
