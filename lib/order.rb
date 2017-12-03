
class Order

  attr_reader :current_order

  def initialize(dish)
    @current_order =[dish]
  end

  def add_to_order(dish)
    @current_order << dish
  end

end
