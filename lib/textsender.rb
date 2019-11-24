require 'twilio-ruby'

class Textsender 

  def send_text
    account_sid = ENV['ACC_SID']
    auth_token = ENV['AUT_TOK']

    @client = Twilio::REST::Client.new account_sid, auth_token
    
    deliver_time = Time.now + 3600 #3600 secs from now
    time = deliver_time.strftime("%H:%M")
    
    message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{time}",
    to: ENV['NUMBER'],
    from: ENV['SENDER']) 
  end
end