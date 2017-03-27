require 'twilio-ruby'
require_relative '../private_details.rb'

# Class responsible for sending confirmation text
class ConfirmationText

  def initialize(client: nil, details: Details.new)
    @details = details
    @client = (client || Twilio::REST::Client.new(details.account_sid, details.auth_token))
  end

  def send_text
    @client.messages.create(info)
  end

  def delivery_time
    (Time.now + 60 * 60).strftime("%H:%M")
  end

  private
  attr_reader :client

  def info
    confirmation = "Thank you, you're order has been placed! Expected delivery time is: %s" % delivery_time
    @details.info.merge!(:body => confirmation)
  end

end
