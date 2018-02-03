class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def select_dish(dish)
    @current_order << dish
  end

end
