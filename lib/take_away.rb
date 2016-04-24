class TakeAway
  attr_reader :menu, :order

  def initialize (menu:, order: nil)
    @menu = menu
    @order = order
  end
  def show_menu
    menu.list_menu
  end

  def place_order(selected_dishes)
    selected_dishes.each do |dish, quantity|
      order.add(dish,quantity)
    end
    order.total
  end

  def checkout
    order.total
  end
end
