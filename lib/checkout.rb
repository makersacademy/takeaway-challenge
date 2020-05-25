require 'rubygems'
require 'twilio-ruby'
require 'time'

class Checkout

  def place_order
    request_number
    send_sms
    confirmation
  end

  private 

  def request_number
    puts "Please enter your phone number to complete the order:"
    print "+44 "
    @user_phone = gets.chomp
  end

  def send_sms
    account_sid = 'AC04c8a6f49cf221b23f510c6448eabbc8'
    auth_token = '6287e640f764abefad84f6b6b12c0447'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
      from: '+12058581529',
      to: '+44' + @user_phone
      )
  
    puts message.sid
  end

  def delivery_time
    time = Time.new + 3600
    time.strftime("%k:%M")
  end

  def confirmation
    puts "Your order is on it's way! Please check your phone for confirmation."
  end
end
