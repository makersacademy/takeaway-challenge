require_relative 'menu'
require_relative 'text'

class Order
  attr_reader :menu, :text

  def initialize(menu: Menu.new, text: Text.new)
    @menu = menu
    @text = text
    @order = []
    @order_sum = []
  end

  def read_menu
    @menu.show
  end

  def add(item, qty=1)
    error = "That's not on this menu."
    raise error unless read_menu.include?(item)
    order_sum(item, qty)
    order(item, qty)
  end

  def summary
    order_list = ''
    @order.each do |qty, item, price|
      string = "#{qty}x #{item}(s), £#{price} each. Total: £#{qty*price}.\n"
      order_list << string
    end
      order_list
  end

  def calculate_total
    @total = @order_sum.reduce(:+)
    "Your total for this order is £#{@total}."
  end

  def pay(amount)
    error = 'payment is incorrect'
    raise error unless payment_correct?(amount)
    @text.send_confirmation(confirmation_text)
  end

  private

  def confirmation_text
    "Thank you! Your order should be with you by #{time}"
  end

  def time
    delivery = (Time.now + 3600).strftime("%H:%M")
  end

  def payment_correct?(amount)
    @total = amount
  end

  def order_sum(item, qty)
    qty.times{@order_sum << read_menu[item]}
  end

  def order(item, qty)
    @order << [qty, item, read_menu[item]]
    "#{qty}x #{item}(s) added to your order."
  end
end
