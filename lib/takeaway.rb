require_relative 'menu'

class Takeaway
  attr_reader :order

  def initialize
    @order = {}
  end

  def show_menu
    Menu::TODAYS_MENU
  end

  def add_item(item, quantity)
    if Menu::TODAYS_MENU.has_key?(item.to_sym)
      @order[item.to_sym] = quantity
      "We have added #{quantity} #{item}s to your order"
    else not_on_menu
    end
  end

  def not_on_menu
    fail "Sorry, we do not have this on our menu"
  end

  def order_total
    @order
  end

end
