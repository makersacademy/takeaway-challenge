require_relative 'menu'
class Order
  attr_reader :my_order

  def initialize(menu = Menu.new)
    @my_order = {}
    @menu = menu
  end

  def display_menu
    @menu.duplicate_menu
  end

  def select_meal(dish, quantity=1)
    unless @menu.duplicate_menu.keys.include?(dish)
      raise "Please select a dish from the menu."
    end
    @my_order[item] = quantity
  end

  def totaliser
    total = @my_order.map do |k, v|
      @menu.dishes[k] * v
    end
    total.inject(:+)
  end
end
