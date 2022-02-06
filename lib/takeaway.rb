class Takeaway

  attr_reader :menu, :current_order

  def initialize(menu)
    @menu = menu
    @current_order = nil
  end

  def start_new(order)
    @current_order = order
  end

end
