class Order
  attr_reader :summary
  def initialize
    @summary = []
  end
  def add(dish)
    @summary << dish
  end
end
