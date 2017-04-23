require 'twilio-ruby'

class TextNotifier
  def self.send_sms(number, body)
    new.send_sms(number, body)
  end

  def initialize
    @account_sid = "AC9d3635a19fddd31127f4b65482b01447"
    @auth_token = "5027cc2f218c3b5dd5e13165d48b0f71"
    @from_number = "+441732252223"
  end

  def send_sms(number, body)
    text(number, body)
  end

  private

  def text(number, body)
    message = client.account.messages.create(
      :body => body,
      :to => number,
      :from => @from_number
    )
  end

  def client
    Twilio::REST::Client.new @account_sid, @auth_token
  end
end
