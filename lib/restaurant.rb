class Restaurant
  def initialize(orderlist = OrderList, menu = Menu)
    @orderlist = orderlist.new
    @menu = menu.new
  end
end