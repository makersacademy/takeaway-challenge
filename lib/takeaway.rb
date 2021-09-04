
class Takeaway_menu

  attr_reader :menu

  def initialize
    @menu = []
  end 

  def menu
    'pizza'
  end 

  def create_order(order = Order.new)
    @order = order
  end 

end
