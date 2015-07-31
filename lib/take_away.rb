class TakeAway
  attr_reader :menu   
  def initialize menu = []
    @menu = menu
  end
  def add_menu new_menu
    @menu << new_menu
  end
  def place_order order 
    @order = order.meals
  end

  def has_order?
     @order 
  end

end