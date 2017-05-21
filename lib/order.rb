class Order

  attr_reader :current_order

  def initialize(selected_dish)
    @current_order = [selected_dish]
  end

end
  
