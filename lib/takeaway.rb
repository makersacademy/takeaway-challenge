class Takeaway
  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def show_menu
    menu.printing
  end

  def order_placed(dishes_prices)
    dishes_prices.each {|name, qty| order.add(name, qty) }
  end



end
