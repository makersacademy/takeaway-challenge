# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Set up environment variables
account_side = ENV[AC13183f9d8cff503d9b9b8c291f083e88]
auth_token = a90b72b54cbf093e919e5af007177679
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
