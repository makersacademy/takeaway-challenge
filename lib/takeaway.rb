class Takeaway
  def initialize(menu:menu, order:nil)
    @menu = menu
    @order = order
  end

  def dishes_with_prices
    menu.print
  end
  def place_order(dishes)
    dishes.each do |dish,num|
      order.add(dish,num)
    end
  end
  
  private
  attr_reader :menu, :order
end
