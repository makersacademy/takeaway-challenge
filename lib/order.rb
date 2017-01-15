class Order

  attr_accessor :list, :add

  def initialize
    @list = []
  end

  def add(order)
    @list << order.split(', ')
  end

end
