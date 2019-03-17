class Takeaway
  require 'require_all'
  require_all 'lib'
  attr_reader :menu

  def initialize(menu = Menu.new, order_class = Order, text_message = TextMessage.new)
    @menu = menu
    @order_class = order_class
    @text_message = text_message
  end

  def view_menu
    @menu.dishes
  end

  def place_order(order_hash, total)
    @order_class.new.create_order(order_hash, total)
    send_confirmation_text
  end

  private
  def send_confirmation_text
    delivery_estimate = (Time.now + 3600).strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before '#{delivery_estimate}'"
    @text_message.send_text(message)
  end
end
