class TwilioRuby

  def send_sms_request
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create({
      :from => '+441143599202',
      :to => '+447903226001',
      :body => sms_content
      })
  end

  def sms_content
    delivery_time = Time.new + 3600
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

end
