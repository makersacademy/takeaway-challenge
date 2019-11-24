require 'twilio-ruby'

class Textsender 

  def send_text
    account_sid = "ACbe1107b7c6daa8626266761a7d3a12b2"
    auth_token = "36df7a8f4e6e46c4c7d143f19046cbf6"

    @client = Twilio::REST::Client.new account_sid, auth_token
    
    deliver_time = Time.now + 3600 #3600 secs from now
    time = deliver_time.strftime("%H:%M")
    
    message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{time}",
    to: "+447857259816",
    from: "+18153103777") 
  end
end