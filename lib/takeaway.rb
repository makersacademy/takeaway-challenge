require_relative "order"
require_relative "item"
class TakeAway
  CONFIRMATION_MESSAGE = "your order has been placed, and will be delivered before "
  def initialize(item_class = Item)
    @menu = [item_class.new("fish and chips",6.99)]
    @order
  end

  def show_menu()
    for i in 0...@menu.length do
      puts("[#{i}]= #{(@menu[i]).dish}: £#{(@menu[i]).price}")
    end
  end

  def new_order()
    @order = Order.new
  end

  def add_to_order(item,quantity)
    if item.is_a?(Integer) && item >= 0 && item < @menu.length
      @order.add(@menu[item],quantity)
    else
      fail "invalid item"
    end
  end

  def check_total
    @order.total
  end

  def submit_order(number)
    Text.new(CONFIRMATION_MESSAGE+"#{Time.now.hour}:#{Time.now.min+20}")
    @order = nil
    return "a confirmation message has been sent to #{number}"

  end

end