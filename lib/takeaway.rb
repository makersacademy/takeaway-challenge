class Takeaway


  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def view_menu
    menu.view
  end

  def place_order(dishes)
    dishes.each do |dish, quantity| 
      order.add(dish, quantity)
    end
  end

  private

  attr_reader :menu, :order

end