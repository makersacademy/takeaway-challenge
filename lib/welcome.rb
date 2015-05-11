require_relative 'customer'
require_relative 'takeaway'
require_relative 'message_handler'
require_relative 'menu'
require_relative 'order'
require_relative 'dishes'

#>> IRB UI will be welcome.customer.check_menu (under hood calls takeaway)
class Welcome

  attr_accessor :customer

  def initialize(customerClass, takeawayClass, menuClass = Menu, orderClass = Order, message_handlerClass = Message_Handler)
    @customer = customerClass.new
    @customer.takeaway = takeawayClass.new menuClass, orderClass, message_handlerClass
    puts "Welcome to our takeaway >>"
    puts "Please run customer.check_menu to take a look at what we offer"
  end

end