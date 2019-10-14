require_relative "dishes"

class Customer
require 'twilio-ruby'

attr_reader :customer_dishes, :order_msg

  def initialize
    @customer_dishes = []
    @order_msg = "Thank you! Your order was placed and will be delivered"
  end

  def check
    @dishes
  end

  def select(dish)
    @customer_dishes << dish
  end

  def amount_of_dishes
    @customer_dishes.count
  end

#----- I HAVE OUTPUT THE TEXT MESSAGE TO THE TERMINAL -----
  def place_order
    # account_sid = ''
    # auth_token = ''
    # client = Twilio::REST::Client.new(account_sid, auth_token)
    #
    # from = '' # Your Twilio number
    # to = '' # Your mobile phone number
    #
    # client.messages.create(
    # from: from,
    # to: to,
    # body: "#{@order_msg}
    # You ordered: #{@customer_dishes}
    # Total dishes: #{amount_of_dishes}"
    # )
    return @order_msg
  end

end
