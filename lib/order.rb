require_relative 'menu'

class Order

  attr_reader :menu, :customer_order

  def initialize(menu)
    @menu = menu
    @customer_order = {}
  end

  def add(item, quantity)
    @customer_order[item] = quantity
  end
end
