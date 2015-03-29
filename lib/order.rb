class Order
  attr_reader :order
  alias_method :list, :order

  def initialize
    @order = []
  end

  def add item
    order << item
  end

  def priced_list menu
    menu.list.select { |k, _v| order.include? k }
  end

  def total_price menu
    priced_list(menu).values.inject { |sum, v| sum + v }.round(2)
  end
end
