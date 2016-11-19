require_relative 'menu.rb'

class Order

  attr_accessor :orders, :menu_class

  def initialize(menu_Klass)
    @menu_class = menu_Klass
  end

  def see_menu
    @orders = @menu_class.new
  end

  def order_food(order_number, quantity)
    orders.make_selection(order_number, quantity)
  end

  def display_bill
    orders.users_order
  end

  def calculate_price
    current_order = orders.users_order.map {|choice| choice[:price]}.inject(0, :+)
    return "The total cost is £#{current_order}"
  end



end
