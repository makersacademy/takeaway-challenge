require 'twilio-ruby'
require 'dotenv'
Dotenv.load
require_relative 'menu'
require_relative 'order'


class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = Order.new(@menu)
  end

  def correct_amount?(price)
    order.my_total == price
  end

  def complete_order(price)
    if correct_amount?(price)
      send_text("Thank you! Your food order of £#{price} will be delivered before #{delivery_time}")
    else
      raise "your total of £#{price} does not match the calculated sum of £#{@order.sum_total}"
    end
  end

  def send_text(confirmation_message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    text_message = @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create( to: ENV['MY_NUMBER'], from: ENV['TWILIO_NUMBER'], body: confirmation_message)
  end



  private

  def delivery_time
    time = Time.new
    t = time + 45*60
    return "#{t.hour}.#{t.min}"
  end


end
