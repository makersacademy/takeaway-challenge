class LineItem
  attr_accessor :dish, :sub_total

  def initialize
    @dish = {}
    @sub_total = 0
  end

  def add add_qty, add_dish
    @dish = { add_dish.keys[0] => add_qty }
    @sub_total = (add_dish.values[0] * add_qty)
  end
end
