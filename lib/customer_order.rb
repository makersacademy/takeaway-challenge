
require_relative './dish'
require_relative './menu'
require_relative './orderlistcalculator'

require 'envyable'
Envyable.load('./config/env.yml', 'development')
require 'twilio-ruby'
require 'date'

class CustomerOrder
  ADDITIONAL_TIME = 45*60

  def initialize(phone_number = nil, name = nil, contents = [])
    @phone = phone_number
    @contents = contents
    @name = name
  end

  def add(*order)
    order.each { |order|
    @contents << order
  }
  end

  def show_contents
    @contents
  end

  def count_em(string, substring)
  string.each_char.each_cons(substring.size).map(&:join).count(substring)
  end

  def process
    string, dishes,total = "", [], 0
    contents.each_with_index  { |dish, index|
      string += "Dish: #{dish.name} Price: £#{sprintf('%.2f', dish.price)} Quantity: #{contents.count(dish)}\n" unless dishes.include?(dish.name)
      dishes << dish.name
      total += dish.price
    }
    string += "Total: £#{sprintf('%.2f', total)}"
    puts string

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441740582048"
    add = 45*60
    time = (Time.now + ADDITIONAL_TIME).strftime("%H.%M")
      client.account.messages.create(
        :from => from,
        :to => @phone,
        :body => "Hello #{@name}, your order has been dispatched from Makers Bistro.\n#{string} It will arrive in #{ADDITIONAL_TIME/60} minutes at #{time}!"
      )
  end

  private
  attr_reader :contents

end
