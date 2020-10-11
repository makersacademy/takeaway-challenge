class Order
  attr_reader :menu, :current_order

  def initialize(menu)
    @menu = menu
    @current_order = []
  end

  def add_order(item, quantity)
    fail "Item not available" if not_available?

    @current_order.fill(item, @current_order.size, quantity)
  end

  private

  def not_available?
  end

end


