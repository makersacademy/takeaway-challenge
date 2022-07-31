require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load('file.env')

class TextCustomer
  
  def confirmation
    order = Order.new
    order.confirm_order == "Y" ? customer_phone = gets.chomp : order.confirm_order
    customer_phone = "+44" + customer_phone
  end

  def time
    time = Time.now + 3600
    time.strftime("%k:%M") 
  end

  def send_text
    delivery_time = self.time
    account_sid = ENV[ 'ACCOUNT_SID' ]
    auth_token = ENV['AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['FROM'] # Your Twilio number
    to = ENV['TO'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! your order was placed and will be delivered before #{delivery_time}"
    )
  end
end