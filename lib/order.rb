require 'twilio-ruby'
require 'dotenv/load'
Dotenv.load('file1.env')

class Order

  def initialize(meal = Meal.new)
    @meal = meal
    menu
  end

  def choose(selection, quantity)
    @meal.add_dish(selection, quantity)
  end

  def price
    @meal.sum_of_basket
  end

  def current_order
    @meal.basket
  end

  def checkout(payment_value)
    fail "This is not the correct amount, check the current price!" if payment_value != price
    account_sid = ENV['ACC_SID']
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      body: message_body,
      to: ENV['MY_NUM'],
      from: ENV['TWIL_NUM']
    )
    "Checkout complete!"
  end

  private

  def menu
    @meal.menu.list
  end

  def message_body
    "Thank you! Your order has been placed and will be delivered at #{delivery_time}"
  end

  def delivery_time
    "#{Time.new.hour}:#{Time.new.min + 10}"
  end

end
