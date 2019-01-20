class Order

  attr_accessor :order

  def initialize(dish)
    @dish = dish
    @order = []
  end

end
