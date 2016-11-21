require 'dotenv'
Dotenv.load

require 'twilio-ruby'

class Confirmation
  attr_reader :account

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @account = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation(phone_number = ENV['TWILIO_NUMBER2_TOKEN'])
    time = Time.new + (60 * 60)
    @account.messages.create(
      from: ENV['TWILIO_NUMBER_TOKEN'],
      to: phone_number,
      body: "Your food is being cooked and will be delivered at #{time.strftime('%H:%M')}."
    )
  end

end
