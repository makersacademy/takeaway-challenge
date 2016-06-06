require 'twilio-ruby'

class Message

  def initialize
    @account_sid = 'AC523a45e9dac5d5632587d0287ee72602'
    @auth_token = 'e3c83928fa83c36efd5f66589f4a2e05'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send
    delivery_time = (Time.now + 3600).strftime("%H:%M")
    @client.account.messages.create({from: "+441361866056", to: "+447533736095", body: "Thank you for your order. It will be delivered before #{delivery_time}"})
  end
end