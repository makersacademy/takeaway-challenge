require 'twilio-ruby'
class DeliveryTime

  attr_reader :new_time

  def initialize(number)
    @number, time = number, Time.new
    @new_time = (time.hour + 1).to_s + ":" + time.min.to_s
    # sets values for login
    account_sid, auth_token = 'account_sid', 'auth_token'
    # logs in
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    message = @client.messages.create(to: @number,# phone number
      body: "Thank you! Your order was placed and will be delivered before #{@new_time}",
      from: "+12563877057")# use this number for sms
    puts message.sid
    'sent'
  end

end
