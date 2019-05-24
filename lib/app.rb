
class App
  attr_reader :menu, :order_class, :current_order
  def initialize(menu_class = Menu, order_class = Order)
    @menu = menu_class.new
    @order_class = order_class
    @current_order = nil
  end 

  def display_menu
    menu.display
  end
  
  def new_order
    @current_order = order_class.new
  end 

  def select_dish(item, quantity)
    if @current_order == nil 
      new_order
    end
    selected = menu.select(item, quantity)
    current_order.add_to_cart(selected)
  end 
  
  def check_total(number)
    @current_order.check_total(number)
  end

  def confirm_order
  end
end

