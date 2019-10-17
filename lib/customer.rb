require_relative "dishes"

class Customer
require 'twilio-ruby'

attr_reader :customer_dishes, :order_msg, :total

  def initialize
    @customer_dishes = []
    @order_msg = "Thank you! Your order was placed and will be delivered"
  end

  def check
    dish = Dishes.new
    return dish.list_dishes
  end

  def select(dish)
    @customer_dishes << dish
  end

  def total_of_dishes
    i = 0
    while i > @customer_dishes.length do
      total = total.to_i + @customer_dishes[i].to_i
      i = i + 1
    end

    return total
  end

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
