class Order
  attr_reader :list

  def initialize
    @list = []
  end

  def add(dish)
    @list << dish
  end

end
