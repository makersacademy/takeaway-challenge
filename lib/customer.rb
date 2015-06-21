class Customer

  attr_accessor :order

  def initialize
    @order = {}
  end

  def check_menu(menu)
    menu.view_menu
  end

  def add_to_order(menu,food,quantity)
    self.order.has_key?(food.to_sym) ? self.order[food.to_sym][0] += quantity : order[food.to_sym] = [quantity, menu.items[food.to_sym]]
  end


end
