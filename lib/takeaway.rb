require_relative 'menu'
require_relative 'order'
#require_relative 'send_sms'

class Takeaway

  attr_reader :menu, :name

  def initialize(name, menu = Menu.new)
    @name = name
    @menu = menu
  end

  def display_menu
    @menu.show_menu
  end

  def create_order(order = Order.new(self))
     order
  end
end
