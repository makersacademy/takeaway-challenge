require './lib/menu_module.rb'
require './lib/text_module.rb'
require './lib/price_module.rb'

class Order

  include Text, Price, Menu

  PRICE_ERROR = "Incorrect price, order rejected".freeze

  attr_reader :current_order

  def initialize
    @current_order = []
    @total = 0
    super
  end

  def add_to_order(item, quantity, price)
    raise "Item not on menu" unless on_menu?(item)
    raise PRICE_ERROR unless correct_price?(item, quantity, price)
    order = ["#{quantity} x #{item} = £#{price}"]
    update_order(order, price)
  end

  def total
    "£#{@total}"
  end

  def finalize_order
    body = "Thanks for your order! It's on its way and should be with you by " + (Time.new + 3600).to_s[11..15] + "!"
    text_confirmation(body)
  end

  private

  def update_order(order, price)
    @current_order << order
    update_total(price)
  end

end
