
class Order
attr_reader :current_order

  def initialize(chosen_dishes)
    @current_order = chosen_dishes
  end

end