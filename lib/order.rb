require_relative 'menu'
require_relative 'text'
class Order
  attr_reader :current_order, :order_total

  def initialize
    @current_order = []
  end

  def select_item(menu, item, quantity)
    item_included?(menu, item)
  end

  def calculate_price

  end

  def complete_order
    # totalprice
    Text.new.send_text
    @current_order
  end

  private

  def item_included?(menu, item)
    if item == 'chips' or item == 'sausage' or item =='fish'
      @current_order << item
    else
      raise 'please select item from menu'
    end
  end
end
