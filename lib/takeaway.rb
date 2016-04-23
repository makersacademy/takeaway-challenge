class TakeAway
  attr_reader :order

  def initialize
    @order = {}
  end

  def dishes(menu = Menu.new)
    @menu = menu
  end

  def select(dish, quantity)
    add_to_order(dish, quantity)
  end

  private

  def add_to_order(dish, quantity)
    @order.store(dish, quantity)
  end
end
