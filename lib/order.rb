class Order

  attr_reader :order

  def initialize
    @order =[]
  end

  def add(name, number = 1)
    @order << {(name) => number}
  end

end
