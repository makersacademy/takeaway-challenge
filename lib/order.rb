class Order

  attr_reader :current_order

  def initialize
    @current_order = {}
  end

  def store_order(dish, portions)
    if current_order[dish]
      current_order[dish] += portions
    else
      current_order[dish] = portions
    end
  end
end
