class Takeaway
attr_reader :order
  def initialize(menu:menu)
    @menu = menu
    @order = []
  end

  def dishes_with_prices
    menu.print
  end

  def select_dish
    @menu.select{ |dish, price| }
  end

private
attr_reader :menu
end
