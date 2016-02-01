require_relative 'menu'
require_relative 'message'
require_relative 'order'
require 'forwardable'


class Takeaway

  extend Forwardable

  attr_reader :basket, :menu

  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
  end

  def_delegators :@menu, :see_menu

  def order(dish, quantity = 1)
    count = quantity + basket[dish] if basket[dish]
    basket[dish] = count
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def correct_order(dish, quantity = 1)
    count = basket[dish]-quantity if basket[dish]
    if count < 1
      basket.delete(dish)
      "#{dish} was removed from your basket."
    else
      basket[dish] = count
      "#{quantity}x #{dish}(s) now in your basket."
    end
  end

  def basket_summary
    summary = []
    basket.each do |name, quantity|
      summary << "#{name} x#{quantity} = £#{menu.menu_list[name]*quantity}"
    end
    summary.join(', ')
  end

  def total
    summary = 0
    basket.each do |name, quantity|
      summary += menu.menu_list[name]*quantity
    end
    "Total: £#{format("%.2f", summary)}"
  end

  def complete_order(final_amount)
    msg_body = "Thank you! Your order with total price "
    msg_body += "of £#{format("%.2f", final_amount)} "
    msg_body += "is confirmed and will be delivered to you "
    msg_body += "before #{self.delivery_time}!"
    send_sms(msg_body)
  end

  def send_sms(text, message_klass = Message)
    message = message_klass.new
    message.send_message(text)
    text
  end

  def delivery_time
    time = Time.now + 3600
    time.strftime("%H:%M")
  end
end