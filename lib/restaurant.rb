class Restaurant
  attr_reader :menu, :orders
  def initialize(orderlist = OrderList, menu = Menu)
    @orders = orderlist.new
    @menu = menu.new
  end
end