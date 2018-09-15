class OrderList
  attr_reader :orders
  def initialize
    @orders = []
  end
  def show_list
    orders
  end
end
