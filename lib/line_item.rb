class LineItem
  attr_accessor :dish, :sub_total

  def initialize
    @dish = Hash.new
    @sub_total = 0
  end

  def add add_qty, add_dish
    # @dish = Hash.new
    @dish = { add_dish.keys[0] => add_qty }
    @sub_total = (add_dish.values[0] * add_qty)
  end
end
