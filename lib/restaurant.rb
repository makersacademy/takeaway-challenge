require 'order'

class Restaurant
  attr_reader :current_order  

  def initialize(order = Order, menu:)
    @menu = menu
    @current_order = []
    @order = order
  end

  def print_menu
    menu.print_menu
  end

  def add_to_order(dish, quantity = 1)
    raise "Cannot add to order: Item is not on menu" if not_on_menu?(dish) 
    current_order << @order.new(dish, quantity)
  end

  private
  attr_reader :menu, :order
  
  def not_on_menu?(dish)
    !menu.dishes.include?(dish.downcase.to_sym)
  end  
end
