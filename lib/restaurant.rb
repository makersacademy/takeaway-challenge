
require_relative 'order'
require_relative 'message'
require_relative 'menu'

class Restaurant
# The customer interacts with this class
  def initialize(menu = Menu.new, order = Order.new)
    @order = order
    @menu = menu
  end

  def view_menu
    @menu.display
  end

  def add_to_order(dish, quantity)
    @order.add(dish, quantity)
  end
  
  def view_order
    @order.display
  end

  def check_total
    @order.check_total? ? "Your order total has been calculated correctly" : "Your order total does not match the cost of dishes ordered. Speak to the staff."    
  end

  def complete_order
    message = Message.new # is this fine here, or do I need to inject it in as an argument? Not sure if dependency injection is really necessary with Twilio class?! 
    p total = '%.2f' % @order.basket_total #converts the number into a string with 2 decimals i.e. currency format
    p message.send(total) 
    p "here"
  end

end
p r = Restaurant.new
p r.complete_order