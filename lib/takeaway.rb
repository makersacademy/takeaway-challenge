require_relative "menu"
require_relative "order"
require_relative "messaging"

class Takeaway
  attr_reader :menu, :order, :price, :messager

  def initialize(menu = Menu.new, order = Order.new, messager = Messager.new)
    @menu = menu
    @order = order
    @messager = messager
  end

  def open_menu
    menu.open_menu
  end

  def add_to_order(item, quantity = 1)
    order.add_to_basket(item, quantity)
    "You have added x#{quantity} #{item} to your basket."
  end

  def view_basket
    order.order_summary
  end

  def order_total
    @price = order.order_cost.scan(/\d+\.?\d\d/).join("")
    "Total Order Cost: £#{@price}"
  end

  def checkout(amount)
    p check_price?(amount)
    check_price?(amount) ? send_text : (fail "Wrong amount")
  end

  private

  def check_price?(amount)
    sprintf("%.2f", amount) == @price
  end

  def send_text
    messager.send_message
  end

end
