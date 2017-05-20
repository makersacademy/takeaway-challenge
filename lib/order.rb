# It is responsbile for compiling a user's order

class Order

  attr_reader :current_order

  def initialize(menu_item)
    @current_order = [menu_item]
  end

end
