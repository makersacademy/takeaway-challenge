class Order

  attr_reader :order

  def initialize
    @order =[]
  end

  def add(item)
    @order << item
  end

end
