require_relative './menu'
require_relative './message'

class Order

attr_reader :current_order_price, :menu, :message

  def initialize
    @current_order_price = 0
    @menu = Menu.new
    @message = Message.new
 end

  def order(item, quantity)
    fail "Cannot add item(s): quantity is less than one." if quantity < 1
    fail "Cannot store order: no such item exists." if menu_check[item] == nil
    bill(item, quantity)
    "You have ordered #{quantity} #{item}(s)."
  end

  def expected_total(total)
    total == @current_order_price? text_message : "Your total is wrong: please enter the correct total."
  end

private

  def text_message
    message.text
  end

  def menu_check
    menu.list_of_dishes
  end

  def bill(item, quantity)
    @current_order_price += menu.list_of_dishes[item] * quantity
  end

end
