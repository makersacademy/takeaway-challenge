require 'twilio-ruby'
require 'dotenv/load'

module MessageMod

  def send_message
    # put your own credentials here
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    twilio_no = ENV['TWILIO_NO']
    customer_no = ENV['CUSTOMER_NO']

    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new account_sid, auth_token
    client.messages.create(
    body: "Thank you! Your order will be delivered before #{delivery_time}",
    from: twilio_no,
    to: customer_no)
  end

  def delivery_time
    "#{(Time.now + 3600).strftime('%H:%M')}"
  end

end
