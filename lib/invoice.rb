# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Set up environment variables
account_side = ENV[]
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
