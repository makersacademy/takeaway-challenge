require_relative 'menu'
require_relative 'sms'
require 'twilio-ruby'
require 'time'

class TakeAway #stores the items in basket
  attr_reader :basket, :menu, :total
  attr_writer :basket


  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def read_menu
    menu.list_items
  end

  def order(item, quantity = 1)
    raise "That item is not on the menu. Try another dish." unless menu.list_items.key?(item)
    confirm_to_user(item, quantity)
    delete_duplicate(item)
    # order_item()
    basket << {item => quantity}
  end

  def place_order(cost)
    sms = SMS.new
    fail_message = "You expected your order to cost #{cost}. It actually costs #{@total}. Please try ordering again."
    fail fail_message if cost != @total
    message = "Thank you. Your order costs £#{@total} and will be delivered at #{time_now.strftime "%H:%M"}."
    sms.send_sms(message)
    message
  end



  def basket_summary
    basket.collect { |order| "#{order.keys.pop} x #{order.values.pop} = £#{order.values.pop * menu.list_items[order.keys.pop]}" }.join(", ")
  end

  # def total
  #   z = []
  #   read_menu.each_pair { |k,v| z.push basket.find {|item| item[k] }[k] * v}
  #   "Total: £#{z.reduce(:+).round(2)}"
  # end

  def total
    @total = (basket.collect {|order| order.values.pop * menu.list_items[order.keys.pop]}).reduce(:+).round(2)
    "Total: £#{@total}"
  end

  private
  def time_now
    DateTime.now + 1/24.0
  end

  def delete_duplicate(item)
    basket.delete_if { |i| i.include? item }
  end

  def confirm_to_user(item, quantity)
    "#{quantity}x #{item}(s) added to your basket."
  end

end
