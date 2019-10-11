require 'twilio-ruby'
class DeliveryTime

  def initialize(number)
    @number, @time = number, Time.new
    @new_time = (@time.hour + 1).to_s + ":" + @time.min.to_s
    # sets values for login
    @account_sid, @auth_token = 'AC94392cc1d5ae8e5f01f162d5c6bc0a29', '0e563372bfd9ec7e38f315e0b77ae2f4'
    # logs in
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end
  
  def send
    message = @client.messages.create(to: @number,# phone number
      body: "Thank you! Your order was placed and will be delivered before #{@new_time}",
      from: "+12563877057")# use this number for sms
    puts message.sid
    'sent'
  end

end
