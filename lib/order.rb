require_relative 'dish'
require 'twilio-ruby'

class Order

  attr_reader :order_list, :total

  def initialize
    @order_list = []
    @total = 0
  end

  def add(dish, quantity)
    add_order_to_list(dish, quantity)
  end

  def total
    order_total
  end

  def place_order
    puts "Thank you, your order has been placed and will be delivered before #{Time.now + 3600}. You will receive a confirmation text shortly!"
    send_confirmation_text
  end

  private

  def order_total
    @order_list.map { |dish| dish.price }.sum
  end

  def add_order_to_list(dish, quantity)
    quantity.times { order_list << dish }
  end

  def send_confirmation_text
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: "+12058989460",
      body: "Thank you! Your order was placed and will be delivered before #{Time.now + 3600}"
    )
  end
end
