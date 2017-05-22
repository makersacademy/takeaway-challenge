require 'twilio-ruby'

class Sms
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send(message)
    client.account.messages.create(
      :body => message + " It will be delivered before #{delivery_time}",
      :to => ENV['MY_PHONE_NUMBER'],
      :from => ENV['TWILIO_PHONE_NUMBER'])
  end

  private

  attr_reader :client

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end
end
