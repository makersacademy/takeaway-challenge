class LineItem
  attr_reader :dish, :quantity, :sub_total

  def initialize(opt = {})
    @dish  = opt[:dish]
    @quantity = opt[:quantity]
  end

  def sub_total
    dish.price * quantity
  end
end
