require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Notifier

  attr_reader :message

  def initialize(client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']))
    @client = client
  end

  def send_message(price)
  # this method calls the Twilio API
    @client.account.messages.create({
      :from => ENV['TWILIO_NUMBER'],
      :to => ENV['TO_NUMBER'],
      :body => gen_message(price),
      })
  end

#private

  def gen_message(total_price = 0)
    "Thank you for your order: £#{total_price}."\
    "Order was placed and will be delivered before 18:52"
  end

end
