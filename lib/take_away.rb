class TakeAway

  def initialize (menu:, order:)
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

  end
attr_reader :menu, :order
end
