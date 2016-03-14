require_relative 'menu'
class Order
  attr_reader :my_order

  def initialize(menu_klass = Menu)
    @my_order = {}
    @menu = menu_klass.new
  end

  def display_menu
    @menu.duplicate_menu
  end

  def select_meal(dish, quantity=1)
    #Consider dropping next two lines into private validator method.
    unless @menu.duplicate_menu.keys.include?(dish)
      raise "Please select a dish from the menu."
    end
    @my_order[dish] = quantity
  end

  def totaliser
    #As above, can split this method.
    total = @my_order.map do |k, v|
      @menu.dishes[k] * v
    end
    total.inject(:+)
  end
end
