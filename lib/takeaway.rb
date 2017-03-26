require_relative 'menu'
require 'twilio-ruby'

class TakeAway #stores the items in basket
  attr_reader :basket, :menu
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
    basket << {item => quantity}
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
    total = (basket.collect {|order| order.values.pop * menu.list_items[order.keys.pop]}).reduce(:+).round(2)
    "Total: £#{total}"
  end

  def twillz
    account_sid = "ACe4e7f5d6667945e5486bd07a9be8168e" # Your Account SID from www.twilio.com/console
    auth_token = "{{ f3b554ecf44c9d3b2d56c282a570b97c }}"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => "Hi, it's Colin!!!",
        :to => "+447933724561",    # Replace with your phone number
        :from => "+441618507364")  # Replace with your Twilio number

    puts message.sid
  end

  private

  def delete_duplicate(item)
    basket.delete_if { |i| i.include? item }
  end

  def confirm_to_user(item, quantity)
    "#{quantity}x #{item}(s) added to your basket."
  end

end
