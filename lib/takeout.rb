class Takeout
  attr_reader :list
  attr_accessor :order

  def initialize(list = {'A' => 15, "B" => 10})
    @list = list
    @order = {}
  end

  def select(item, number)
    order[item] = number
  end

  def price
    order.reduce(0){|sum, (item, value)| sum + (value * list[item]) }
  end
end
