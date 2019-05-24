require_relative 'menu'
require_relative 'text'

class Order
  attr_accessor :menu
  attr_accessor :order_list
  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new, notification = Notification.new)
    @order_list = {}
    @menu = menu
    @notification = notification
  end

  def add(item, quantity = DEFAULT_QUANTITY)
    if @order_list.include?(item)
      @order_list[item] += quantity
    else
      @order_list[item] = quantity
    end
    "#{quantity} #{item}(s) added to your order"
  end

  def total
    total_price = 0
    @order_list.each do |item, quantity|
      total_price += quantity * @menu.price(item)
    end
    total_price
  end
  

  def complete
    formatted_total = "£#{sprintf("%.2f", total)}"
    message = "You complete legend, thanks for ordering. Your total to pay is #{formatted_total}."
    @notification.send_text(message)
  end

end
