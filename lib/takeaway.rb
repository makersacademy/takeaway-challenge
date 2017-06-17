
require "order"
require "message"
require "menu"

class Takeaway

attr_reader :menu, :order, :message

def initialize(menu = Menu.new, order = Order.new, message = Message.new)
  @menu = menu
  @order = order
  @message = message
end

end
