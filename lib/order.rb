require_relative './menu'
require_relative './message'

class Order

attr_reader :current_order_price, :menu

  def initialize
    @current_order_price = 0
    @menu = Menu.new
    @message = Message.new
 end

  def order(item, quantity)
    fail "Cannot add item(s): quantity is less than one." if quantity < 1
    bill(item, quantity)
    "You have ordered #{quantity} #{item}(s)."
  end

  def expected_total(total)
    total == @current_order_price? @message.text : "Your total is wrong: please enter the correct total."
  end


private

  def bill(item, quantity)
    @current_order_price += menu.list_of_dishes[item] * quantity
  end

end
