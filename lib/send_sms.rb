require 'twilio-ruby'

module Sms

  def get_sms_details
    details = ["Twilio Account SID", "Twilio Auth Token", "Twilio Phone Number (including country code)", "Customer Phone Number (including country code)"]
    details.size.times do |i|
      print "Please enter your #{details[i]}: "
      details[i] = gets.delete!("\n")
    end
    send(details[0].to_s,details[1].to_s,details[2].to_s,details[3].to_s)
  end

  def send(account_sid,auth_token,twilio_phone,customer_phone)
    account_sid = "#{account_sid}"
    auth_token = "#{auth_token}"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: "#{twilio_phone}",
      to: "#{customer_phone}",
      body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%H:%M")}"
    )
  end

end
