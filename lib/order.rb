class Order

  attr_reader :list

  def initialize
    @list = {}
  end

  def order_item(item, quantity)
    list[item] = quantity
  end

end
