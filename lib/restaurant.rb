require_relative 'order'


class Restaurant

  attr_reader :current_order

  def initialize
    @current_order = []
  end
  def view_menu
    Menu.new.see_menu
  end

  def place_order(dishes)
    @current_order << Order.new.add_to_order(dishes)
  end

  def review_order
    @current_order.join(', ')
  end

end
