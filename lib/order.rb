class Order

  attr_reader :dishes_ordered

  def initialize

    @dishes_ordered = {}

  end

  def add_to_order(dish,quantity)

    @dishes_ordered[dish] = quantity

  end

end
