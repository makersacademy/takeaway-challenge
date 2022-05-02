require_relative 'menu'
require 'rubygems'
require 'twilio-ruby'
require 'time'

class Order

  attr_reader :menu, :customer_order

  def initialize(menu = Menu.new)
    @menu = menu
    @customer_order = Hash.new(0)

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

  end

  def add_dish(item)
    @menu.check_if_available(item)
    @customer_order[item] += @menu.dishes[item]
  end

  def view_order
    order_subtotals
    order_total
  end

  def place_order
    send_text
    "Thank you! Your order was placed and will be delivered by #{arrival_time}"
  end

  private 

  def order_subtotals
    @customer_order.each do |item, price|
      if price.positive?
        quantity = (@customer_order[item] / @menu.dishes[item]).round
        puts "#{quantity}x #{item} £#{price}"
      end
    end
  end
  
  def checkout_total
    @customer_order.select { |_, price| price.positive? }.values.reduce(:+)
  end

  def order_total
    puts "=========="
    puts "TOTAL: £#{checkout_total}"
  end

  def arrival_time
    (Time.now + 1 * 60 * 60).strftime("%k:%M")
  end

  def send_text
    
    @client.messages.create(
    from: ENV['TWILIO_NUM'],
    to: ENV['PHONE_NUM'],
    body: "Thank you! Your order was placed and will be delivered by #{arrival_time}"
    )
  end
end
