require 'twilio-ruby'

class Notifier

  attr_reader :message

  TWILIO_NUMBER = '+441905703014'
  TO_NUMBER = '+447775557777'
  TWILIO_ACCOUNT_SID = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  TWILIO_AUTH_TOKEN = 'your_auth_token'

  def initialize
    @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
  end

  def send_message(message)
  # this method calls the Twilio API
    @client.account.messages.create({
      :from => TWILIO_NUMBER,
      :to => TO_NUMBER,
      :body => message,
      :media_url => nil,
      })
  end


end
