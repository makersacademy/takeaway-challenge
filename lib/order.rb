require_relative 'menu'
require_relative 'text'
class Order
  attr_reader :current_order

  def initialize(menu)
    @current_order = []
  end

  def select_item(item)
    if item == 'chips' or item == 'sausage' or item =='fish'
      @current_order << item
    else
      raise 'please select item from menu'
    end
  end

  def total_price
    @current_order[1].inject(0) { |a, b| a + b }
  end

  def complete_order
    # totalprice
    Text.new.send_text
    @current_order
  end
end
