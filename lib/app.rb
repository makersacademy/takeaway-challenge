class App
  attr_reader :menu, :order_class
  def initialize(menu_class = Menu, order_class = Order)
    @menu = menu_class.new
    @order_class = order_class
  end 

  def display_menu
    menu.display
  end
  
  def new_order
    @current_order = order_class.new
  end 

  def select_dish(item, quantity)
    if @current_order = nil 
      new_order
    end
    selected = menu.select(item, quantity)
    @current_order.push(selected)
  end 
  
end