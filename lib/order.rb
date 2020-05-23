class Order

  attr_reader :order

  def initialize
    @order =[]
  end

  def add(item, number = 1)
    @order << {(item.name) => number}
  end

end
