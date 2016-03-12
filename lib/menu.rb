class Menu

  attr_reader :menu_view

  def initialize(order)
    @menu_view = {eggs: 4,bacon: 3,toast: 4}
    @order = order.new
  end

  def view_menu
    @menu_view
  end

   def order_item(item)
     @order.new_order(item)
   end

end
