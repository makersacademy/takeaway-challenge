require_relative 'menu'
require_relative 'text'

class Order
  attr_reader :current_order, :menu

  def initialize(menu = Menu.new)
    @current_order = {}
    @menu = menu
  end

  def select_item(item,quantity)
    if item_included?(item)
      @current_order[item] = quantity
    else
      raise 'please select item from menu'
    end
  end

  def calculate_price

  end

  def complete_order
    # totalprice
    Text.new.send_text
    @current_order
  end

  private

  def item_included?(item)
    @menu.show_menu.include?(item)
  end
end
