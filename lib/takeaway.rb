class TakeAway
  attr_reader :menu, :orders

  def initialize(menu)
    @menu = menu
    @orders = []
  end

  def take_order(order)
    orders << order
  end
end
