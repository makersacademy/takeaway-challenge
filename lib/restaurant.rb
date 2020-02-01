class Restaurant

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_to_order(dish_name)
    @current_order << dish_name
  end

end
