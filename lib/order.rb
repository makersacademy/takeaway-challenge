class Order

  attr_reader :current_order, :menu

  def initialize
    @current_order = []
    @menu = Menu.new
  end

  def select_food(food, quantity = 1)
    raise "Sorry, #{food} isn't on the menu!" if !(menu.options.has_key?(food))
    current_order << (food + " x#{quantity.to_s}")
  end



  private
  attr_writer :current_order

end
