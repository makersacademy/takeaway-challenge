require 'twilio-ruby'

class TextAlert

  attr_reader :client

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation
    client.messages.create(
    from: ENV['TWILIO_NUMBER'],
    to: ENV['PERSONAL_NUMBER'],
    body: "#{message}"
    )
  end

  private

  def plus_one_hour
    Time.now.hour+1
  end

  def message
    "Thanks for your order, it will be with you at #{plus_one_hour}" + Time.new.strftime("%M")
  end

end
