# It is responsbile for compiling a user's order
require_relative 'menu'

class Order

  attr_reader :current_order

  def initialize(menu_item, price)
    @current_order = [{menu_item => price}]
    @menu
  end

  def add_to_order(new_item, price)
    @current_order << {new_item => price}
  end

end
