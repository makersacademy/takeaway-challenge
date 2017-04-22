require_relative 'takeaway'

class Order

  def initialize
    @order_items = []
    @order_price = 0
  end

  def select_dish(from_menu)
    raise 'That item is not on the menu' unless Takeaway::MENU.include?(from_menu)
  end

end
