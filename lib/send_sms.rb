module SendSMS
  def setup_twilio
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(customers_order)
    time = Time.now
    setup_twilio
    @client.account.messages.create(
      from: '+441412806117',
      to: customers_order[:from].phone,
      body: "Thanks for your order #{customers_order[:from].name}, we're starting it now, hope to be with you around #{time.hour + 1}:#{time.min}")
  end
end