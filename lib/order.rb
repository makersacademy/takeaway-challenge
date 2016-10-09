class Order

  attr_reader :list

  def initialize
    @list = []
  end

  def add_item(item, quantity = 1)
    @list << {item: item, quantity: quantity}
  end

end
