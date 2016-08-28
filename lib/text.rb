require 'twilio-ruby'

class Text

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message
    @client.account.messages.create(
      from: twilio_number,
      to:   my_number,
      body:  "Thank you! Your delivery should arrive by #{eta}",
    )
  end

  def eta
    time = Time.now + (60*60)
    "#{time.hour}:#{time.min}"
  end

  private

  def twilio_number
    ENV['TWILIO_PHONE_NUMBER']
  end

  def my_number
    ENV['MY_NUMBER']
  end


end
