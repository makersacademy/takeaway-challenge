require_relative './menu'

class Takeaway
  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def show_menu
    @menu.dishes
  end

  def add_to_order(dishes, quantity = 1)
    quantity.times {
      @order.push(dishes)
    }
    @order
  end
    
end