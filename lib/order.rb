class Order

  attr_reader :list

  def initialize
    @list = Hash.new(0)
  end

  def order_item(item, quantity)
    list[item] += quantity
  end

end
