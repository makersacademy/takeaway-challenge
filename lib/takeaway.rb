require 'takeaway'
require 'order'

class Takeaway

attr_reader :menu

  def menu
    'pizza'
  end

  def create_order(order = Order.new)
    @order = order
  end

end
