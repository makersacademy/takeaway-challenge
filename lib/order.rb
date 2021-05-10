require 'twilio-ruby'
require_relative 'menu'

class Order
  attr_reader :meal, :total_price, :menu

  def initialize(menu = Menu.new)
    @meal = []
    @total_price = 0
    @menu = menu
    account_sid = #####
    auth_token = #####
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def add(dish)
    dish_details = @menu.select(dish)
    fail "I'm sorry we don't have that dish" if dish_details.nil?

    @meal << dish_details[:name]
    @total_price += dish_details[:price]
  end

  def place_order(phone_number)
    @phone_number = phone_number
    text
    self
  end

  private
  def text
    message = "Thank you for your order, your total comes to £#{@total_price}, 
    and your food will be delivered to you within 1 hour"
    return unless @phone_number.is_a? String

    @client.messages.create(
      from: '+447723429947',
      to: @phone_number,
      body: message
    )
  end
end
