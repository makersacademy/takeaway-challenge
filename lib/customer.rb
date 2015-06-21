require_relative 'menu'
require 'twilio-ruby'
require 'rubygems'

class Customer
  attr_reader :menu, :order
  def initialize (menu)
    @order = {}
    @menu = menu.show_menu
    @total_price = 0
  end

  def add_item (item, number=1)
    raise 'invalid number' if number %1 !=0
    if pizza_already_in_order?(item)
      current_total = order[item]
      order[item] = current_total.to_i+ menu[item]*number
    else
      order[item] = @menu[item]*number
    end
    order
  end

  def remove_item (item, number =1)
    if order[item] > menu[item]
      add_item(item, -1*number)
    else
      @order.delete(item)
    end
    remove_zero_items_from_order(item)
  end

  def remove_zero_items_from_order(item)
    if order[item] ==0
      @order.delete(item)
    end
  end

  def pizza_already_in_order? (item)
    @order.keys.include?(item)
  end

  def total_price
    @total_price=0
    @order.each_value{|price| @total_price += price}
    @total_price
  end

  def place_order payment_amount
    raise 'That is not the correct payment amount!' if payment_amount !=total_price
    print 'Thank you for your order'
    send_text_confirmation
  end

  def send_text_confirmation
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{delivery_time}",
                                              :to => "+447733080200",   
                                              :from => "+44 1243 689132")   
    # puts message.sid

  end

  def delivery_time
    @delivery_time = Time.new + 3600
  end
end
