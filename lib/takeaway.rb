require_relative "order"
require_relative "item"
class TakeAway
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


end