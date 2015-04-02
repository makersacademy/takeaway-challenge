class LineItem
  attr_reader :sub_total, :dish

  def initialize qty, dish
    @sub_total = dish.values[0] * qty
    @dish = { dish.keys[0] => qty }
  end
end
