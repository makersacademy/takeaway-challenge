require_relative 'menu'
class Order
  attr_reader :my_order

  def initialize(menu_klass = Menu)
    @my_order = []
    @menu_klass = menu_klass.new
  end

  def select_meal(dish)
    unless @menu_klass.dishes.keys.include?(dish)
      raise "Please select a dish from the menu."
    end
    @my_order << dish
  end
end
