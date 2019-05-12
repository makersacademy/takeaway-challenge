require_relative 'menu'

class Order
  attr_reader :menu

  def initialize(menu = Menu.new.menu_items)
    @menu = menu
    @order_list = {}
  end

  def add(dish, quantity = 1)
    raise "Item(s) not available, please order again!" unless
    @menu.has_key?(dish)

    @order_list[dish] = 0 unless @order_list[dish]
    @order_list[dish] += quantity
    @order_list
  end

  def total
    total = 0
    @order_list.each do |dish, quantity|
      total += quantity * @menu[dish]
    end
    "Your order total is £#{total}"
  end
end
