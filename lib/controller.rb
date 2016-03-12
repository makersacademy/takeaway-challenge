class Controller

  PAYMENT_ERROR = "Incorrect Payment! Fork over the money yo!"
  WELCOME_MESSAGE =  "Welcome to Fake Takeaway. use #list_dishes for menu,
  #update_order to add a dish and #checkout to pay"

  attr_reader :menu, :order_class, :current_order

  def initialize menu_ofday , order_class
    @order_class = order_class
    @menu = menu_ofday
  end

  def welcome
    @current_order = @order_class.new menu
    WELCOME_MESSAGE
  end

  def list_dishes
    @menu.list_dishes
  end

  def update_order dish , number = 1
    @current_order.add_dish dish , number
    @current_order.update_total
  end

  def checkout payment
    raise PAYMENT_ERROR unless payment == current_order.bill
  end

end
