require_relative './viewer'
require_relative './dish'
require_relative './cart'
require_relative './sms_sender'

class Menu
  attr_reader :dishes
  def initialize(*dishes)
    @dishes = dishes
    @cart = Cart.new
  end

  def view_menu
    Viewer.new.view(@dishes)
  end

  def add_to_order(item)
    fail "item not on menu" unless on_menu?(item)

    @cart.receive_item(item)
  end

  def view_cart
    [Viewer.new.view(@cart.order), convert(@cart.calculate_total)]
  end

  def place_order
    SmsSender.new.send(message)
  end

  private
  def on_menu?(item)
    @dishes.include?(item)
  end

  def convert(price)
    "£#{price.to_s.chars[(0..-3)].join}.#{price.to_s.chars[(-2..-1)].join}"
  end
end
