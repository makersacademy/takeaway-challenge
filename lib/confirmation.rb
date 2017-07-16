# require_relative 'order'
# require 'twilio-ruby'

class Confirmation

  def sent_text
    account_sid = "ACcd3070ef21e9491f59b015cc7507c513"
    auth_token = "93729ab388be8daf9dc58e2ae242699e"
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Thank you! The order was placed and will be delivered before #{delivery_time}",
      to: "+447414900093",
      from: "+441544430025")
  end

  def delivery_time
    (Time.now + 1800).strftime("%H:%M")
  end

end
