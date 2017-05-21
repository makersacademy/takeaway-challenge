class Order

  attr_reader :current_order

  def initialize(selected_dish)
    @current_order = [selected_dish]
  end

  def add(new_dish)
    @current_order << new_dish
  end

end
