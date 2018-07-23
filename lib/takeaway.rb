require_relative 'menu'
require_relative 'basket_manager'
require_relative 'text_manager'


class Takeaway

  def initialize(menu = Menu, text_manager = Text_manager, basket_manager = Basket_manager)
    @menu = menu.new
    @text_manager = text_manager.new
    @basket_manager = basket_manager.new
  end

  def display_menu
    @menu.display_menu
  end

  def add(dish)
    @basket_manager.add_to_basket(dish)
  end

  def deduct(removed_item)
    @basket_manager.remove_item(removed_item)
  end

  def confirm_order
    @basket_manager.confirm_order
  end

  def send_text
    @text_manager.send_text
  end
end
