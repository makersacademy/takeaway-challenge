class Order
  attr_reader :menu, :current_order

  def initialize(menu)
    @menu = menu
    @current_order = []
  end

  def add_order(item, quantity)
    fail "Could not add to order: Item not available" unless available?(item)

    @current_order.fill(item, @current_order.size, quantity)
  end

  private

  def available?(item)
    @menu.any?(item)

  end

end


