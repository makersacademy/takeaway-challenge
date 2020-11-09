class Restaurant
  attr_reader :menu, :orders
  def initialize(orderlist = OrderList, menu = Menu)
    @menu = menu.new
    @orders = orderlist.new(self)
  end
end
