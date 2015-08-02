require_relative 'dish'
require_relative 'menu'
require 'twilio-ruby'

class Customer
  attr_reader :orders, :quantity

  def initialize
    @orders = {}
    @quantity = 0
  end

  def checkout
    p 'Please enter Yes to confirm checkout'
    answer = gets.chomp.upcase
    answer == 'Yes' ? sms : 'No worries'
  end

  def see_menu
    $menu
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
    account_sid = 'AC3c9a6ba39078903404b25681934097d9'
    auth_token = 'dfe2f982531d74d143ed6f14d932c7e1'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: '+441758522009',
      to: '+447463263703',
      body: 'Thank you for your order!! It will be with you shortly within an hour :)'
    )
  end

  def find(dish)
    $menu.select { |key| key == dish }
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
