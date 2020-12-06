# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require_relative './private.rb'

# Set up environment variables
account_sid = 
auth_token =
client = Twilio::REST::Client.new(account_sid, auth_token)

class Invoice
  attr_reader :total

  def initialize
    @total = 0
  end

  def calculate(order)
    order.each do |dish|
      @total += dish[:quantity] * dish[:price_per_item]
    end
    format('%<price>.2f', price: @total)
  end

  def send_text

  end

end
