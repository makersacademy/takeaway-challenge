class Order

  def initialize
    @current_order = []
  end

  def view
    current_order.dup
  end

  def add(menu_item, quantity)
    quantity.times {update_order(menu_item)}
  end

  private

  def update_order(menu_item)
    self.current_order = current_order << menu_item
  end

  attr_accessor :current_order
end
