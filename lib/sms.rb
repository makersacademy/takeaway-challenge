require 'twilio-ruby'


module SMS
  def send_sms
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    from = ENV['TWILIO_NO']
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create(from: from, to: @user_telephone,
      body: @message)
    puts "Your order has been placed, a confirmation text has been sent"
  end

  def sms_and_confirm_prompt
    puts "\n Please enter mobile number and press enter/return to order"
  end

  def generate_sms
    time = Time.now.to_a
    houradjust = time[2]+1
    "Thank you for your order. Your food will arrive before " +
      houradjust.to_s + ":" + time[1].to_s
  end

end
