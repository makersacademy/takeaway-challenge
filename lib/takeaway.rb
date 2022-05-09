require 'order'
class TakeAway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
    @dishes = dishes
  end

  def print_menu
    menu.print
  end

   p def place_order(dishes)

     dishes.each do |dish, quantity|
       order.add(dish, quantity)
     end
     order.total
  end

  private # It’s a type of method that you can ONLY call from inside the class where it’s defined.
  attr_reader :menu, :order, :dishes
end
