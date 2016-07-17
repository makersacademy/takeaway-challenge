require 'twilio-ruby'

class SMS

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @to_number = ENV['TWILIO_TO_NUMBER']
    @from_number = ENV['TWILIO_FROM_NUMBER']
  end

  def delivery_message
    @client = ::Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: from_number,
      to: to_number,
      body: "Your order of has been received and should be with you at #{delivery_time}",
    )
  end

  def delivery_time(time = Time.now)
    (time.hour + 1).to_s + ":" + time.min.to_s
  end

private

  attr_reader :account_sid, :auth_token, :to_number, :from_number

end
