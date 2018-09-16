class Sms
  def initialize
    @account_sid = ENV['twilio_account_sid']
    @auth_token = ENV['twilio_account_auth_token']
    @twilio_phone = ENV['twilio_phone_number']
  end

  def send(customer_number)
    require 'twilio-ruby'

    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    time = (Time.new + 3600).strftime("%H:%M")

    @client.messages.create(
      from: @twilio_phone,
      to: customer_number,
    	body: "Thank you! Your order will be delivered before #{time}",
    )
  end
end
