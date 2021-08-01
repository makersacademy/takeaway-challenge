require 'order'
class Takeaway

  attr_accessor :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order or Order.new
  end

  def print_menu
    @menu.print
  end

  def place_order(ordered_dishes)
    ordered_dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end

    order.total

  end

 
      
      


  
end
  