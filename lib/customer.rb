
require_relative 'order'
require_relative 'menu'
require 'twilio-ruby'
require_relative '../.env.rb'


class Customer

include Menu

  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def list_of_dishes
    Menu::MENU
  end

  def add_dish(dish, quantity)
    order.add_dish(dish, quantity)
  end

  def total_correct(total)
    total == order.total
  end

  def place_order(list = ordered_dishes, total)
    fail "Order is empty" if list.empty?
    fail "Total is not correct" unless total_correct(total)
    send_text
  end

  def send_text
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: ENV['phone'],
      to: ENV['my_phone'],
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60*60).strftime('%H:%m')}")
  end

  private

  def ordered_dishes
     order.dishes
  end
end



