require 'rubygems'
require 'twilio-ruby'

class Customer

  def initialize(number)
    @number = number.to_s
    @send_message = false
  end

  def send_sms_to_customer(send_sms)
    @send_message = send_sms
    send_out_message if @send_message == true
  end

  def create_message
    time = Time.now
    "Thank you! Your order was placed and will be delivered before #{time.hour+1}:#{time.min}"
  end

# Get your Account Sid and Auth Token from twilio.com/user/account
  def send_out_message
    account_sid = ""#put your account details in here
    auth_token =  ""#put your account details in here
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(:body => "#{create_message}",
      :to => "#{@number}",
      :from =>  "" )               # Replace with your Twilio number
    puts message.sid
    @send_message = false
  end
end