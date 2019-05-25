require 'twilio-ruby'
require 'dotenv/load'

class Notification

  def initialize(client = Twilio::REST::Client)
    @new_client = client.new(ENV["TWILIO_ID"], ENV["TWILIO_TOKEN"])
  end

  # # something to ask cohort, or coach...
  # how do i make the initialize of a class 
  # private because i do not want the token 
  # and id printed in irb

  def send_text(message)
    @new_client.messages.create(
      to: ENV["CUSTOMER_NUMBER"],
      from: ENV["TWILIO_NUMBER"],
      body: message)
  end

end
