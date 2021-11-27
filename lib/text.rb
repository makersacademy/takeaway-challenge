require 'twilio-ruby'

module Text
  def send_text
    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]

    # setup sender/receiver
    from = ENV["SENDER_NO"]
    to = ENV["RECEIVER_NO"]
    
    # send an sms
    client.api.account.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now+3600).strftime("%k:%M")}."
    )
  end
end

