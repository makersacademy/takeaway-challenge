require 'twilio-ruby'

class Texter
  def initialize
    account_sid = ENV['SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = ENV['TWILIO_NUMBER']
  end



# Download the twilio-ruby library from twilio.com/docs/libraries/ruby

  def send_text(message, number = ENV['TEST_NUMBER'])
    @client.messages.create(
      from: @from,
      to: number,
      body: message
      )
  end
end

