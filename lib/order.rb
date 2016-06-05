require_relative 'menu'

class Order

  attr_reader :menu, :customer_order

  def initialize(menu)
    @menu = menu
    @customer_order = {}
  end

  def add(item, price)
    @customer_order[item] = price
  end
end
