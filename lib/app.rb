class App
  attr_reader :menu, :order_class, :current_order
  def initialize(menu_class = Menu, order_class = Order, sender_class = Sender)
    @menu = menu_class.new
    @order_class = order_class
    @current_order = nil
    @sender_class = sender_class.new
  end 

  def display_menu
    menu.display
  end
  
  def new_order
    @current_order = order_class.new
  end 
  
  def select_dish(item, quantity = 1)
    new_order if @current_order.nil?
    current_order.add_to_cart(menu.select(item, quantity))
  end 
  
  def check_total(number)
    @current_order.check_total(number)
  end
  
  def send_message
    @sender_class.send_message
  end

  def complete_order
    @current_order = nil
  end

  def place_order(total)
    raise "Incorrect total" if check_total(total) == false
    
    send_message
    complete_order
  end
end
