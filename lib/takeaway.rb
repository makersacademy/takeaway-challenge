class Takeaway

  attr_reader :menu, :order

  def initialize(menu:, order:)
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, amount|
      order.add(dish, amount)
    end 

  end
##private


end
