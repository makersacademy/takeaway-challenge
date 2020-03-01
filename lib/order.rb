require_relative 'menu'
require 'twilio-ruby'

class Order
  DEFAULT_QUANTITY = 1
  attr_reader :menu, :order
  def initialize
    @menu = Menu.new
    @order = []
  end

  def add_to_order(item, quantity = DEFAULT_QUANTITY)
    raise "That is not on the menu!" unless exists?(item)
    quantity.times { @order << { item => @menu.price(item) } }
    "You have added #{item} to your order"
  end

  def show_order
    @order.each do |item| 
      item.each { |food, price| puts "#{food}: £#{price}" }
    end
  end

  def total
    prices_array = []
    @order.each do |item|
      item.each { |food, price| prices_array << price }
    end
    print "Your total is £" + prices_array.sum.to_s
  end

  def check_out
    show_order
    total
  end

  def exists?(item)
    @menu.menu.include?(item)
  end

  def place_order
    send_message
  end

  def send_message
    account_sid = ENV["ACC_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.api.account.messages.create(
        to: ENV["MY_NUMBER"],
        from: ENV["TWILIO_NUMBER"],
        body: "Your order is on the way and will be with you at #{(Time.now + 1 * 60 * 60).strftime("%k:%M")}. Enjoy your food"
    )
  end
end
