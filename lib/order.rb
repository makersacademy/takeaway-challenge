require_relative 'menu'
require_relative 'text'

class Order
  attr_reader :order, :order_sum, :menu, :text

  def initialize(menu: Menu.new, text: Text.new)
    @menu = menu
    @text = text
    @order = []
    @order_sum = []
  end

  def read_menu
    menu_display = ''
    menu_hash.each do |key, value|
      menu_display << "#{key}, £#{value}\n"
    end
     puts menu_display
  end

  def add(item, qty=1)
    error = "That's not on this menu."
    raise error unless menu_hash.include?(item)
    qty.times{@order_sum << menu_hash[item]}
    @order << [qty, item, menu_hash[item]]
    "#{qty}x #{item}(s) added to your order."
  end

  def summary
    order_list = ''
    @order.each do |qty, item, price|
      string = "#{qty}x #{item}(s), £#{price} each. Total: £#{qty*price}.\n"
      order_list << string
    end
      order_list
  end

  def total
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

  def menu_hash
    @menu.show
  end

end
