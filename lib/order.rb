require 'twilio-ruby'
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

  def checkout
    account_sid = "AC16b352672186bfee4bde2c91bb3f4324"
    auth_token = "4f9c8d3c5589ed20f331a9a8baffa969"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      body: message_body,
      to: "+447713853129",
      from: "+441628200825"
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
