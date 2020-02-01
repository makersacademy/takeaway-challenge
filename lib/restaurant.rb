class Restaurant

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_to_order(dish_name)
    @current_order << dish_name
  end
  
  def review_order
    @current_order[0]
  end

end
