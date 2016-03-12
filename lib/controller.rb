class Controller

  attr_reader :menu, :order_class, :current_order

  def initialize menu_ofday , order_class
    @order_class = order_class
    @menu = menu_ofday
  end

  def welcome
  #  print "welcome"
    @current_order = @order_class.new menu
  end

  def list_dishes
    @menu.list_dishes
  end

  def update_order dish
    @current_order.add_dish dish
    @current_order.update_total
  end

  def checkout payment
    raise "Incorrect Payment!" unless payment == current_order.bill
  end

end
