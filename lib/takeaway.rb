# aka the master file
# you only need to require this file in order to test
# any of the functionality
# the twilio stuff won't work because it requires my
# private credentials and these are hidden
require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu_class = Menu)
    @menu = menu_class.new

  end

  def show_menu
    @menu.show
  end

  def make_order(order_class = Order)
    order_class.new(@menu)
  end

end
