class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def select_food(food, quantity = 1)
    current_order << (food + " x#{quantity.to_s}")
  end

  private
  attr_writer :current_order

end
