require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :order

  def initialize(menu)
    @menu = menu
    @order = nil
  end

  def view_menu
    @menu.print_menu
  end

   def create_order
     @order = Order.new
   end

end
