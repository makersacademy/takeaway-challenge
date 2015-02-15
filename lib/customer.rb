require 'rubygems'
require 'twilio-ruby'

class Customer

  def initalize(number)
    @number = number
    @send_message = false
  end

  def send_sms_to_customer(send_sms)
    @send_message = send_smss
  end

  def create_message
    time = Time.now
    "Thank you! Your order was placed and will be delivered before #{time.hour+1}:#{time.min}"
  end

  def send_out_message



account_sid = 'ACd7e183a027dbce9720341d1053705052'
auth_token = 'fa5386f7c33d3f83b6a382ad8564261d'
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(:body => "shsssh chops<3",
    :to => "+447769111156",     # Replace with your phone number
    :from => "+441412804108")   # Replace with your Twilio number
puts message.sid


end