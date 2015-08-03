require_relative 'menu'
require 'twilio-ruby'

class Customer
  attr_reader :orders, :quantity, :menu

  def initialize(menuClass = Menu.new)
    @menu = menuClass
    @orders = {}
    @quantity = 0
  end

  def checkout
    p 'Please enter Yes to confirm checkout'
    answer = gets.chomp.upcase.to_s
    answer == 'Yes' ? sms : 'No worries checkout later'
  end

  def see_menu
    menu.all_dishes
  end

  def place_order(dish, quantity)
    dishes = find(dish)
    orders[dishes.keys[0]] = find_pricing(dishes, quantity)
    @quantity += quantity
    receipt
  end

  def remove_order(dish)
    orders.delete(dish)
    receipt
  end

  private

  def sms
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TIWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: ENV['TWILIO_NUM'],
      to: ENV['MOBILE'],
      body: 'Thank you for your order!! It will be with you shortly within an hour :)'
    )
  end

  def find(dish)
    menu.all_dishes.select { |key| key == dish }
  end

  def number_of_items
    quantity > 1 ? "#{quantity} items" : "#{quantity} item"
  end

  def find_pricing(dish, quantity)
    dish.values[0] * quantity
  end

  def total
    total = orders.values.inject { |memo, price| memo + price }
    orders
    total.round(2)
  end

  def receipt
    "#{orders}" + " Total: #{number_of_items} #{total}GBP"
  end
end
