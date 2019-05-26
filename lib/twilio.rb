require 'twilio-ruby'

class Sender
  def initialize
    @mobile = ENV['mobile']
    @twilio_number = ENV['twilio_number']
    @account_sid = ENV['twilio_sid'] 
    @auth_token = ENV['twilio_auth']
  end
  
  def delivery_time 
    t = Time.now 
    delivery = t.strftime("%H").to_i + 1
    "#{delivery}:#{t.strftime("%M")}"
  end
  def send_message
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    message = @client.messages.create(
        body: "Thank you! 
          Your order was placed and will be delivered before #{delivery_time}",
        to: @mobile,    
        from: @twilio_number)

    puts message.sid
  end
end
