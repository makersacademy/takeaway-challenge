require 'twilio-ruby'

class Text
  def initialize  
    account_sid = ENV["TWILIO_ACCOUNT_SSD"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV["TWILIO_PHONE_NUMBER"]
  end

  def send_message(number)
    @client.messages.create(
      from: @from,
      to: number,
      body: "Thankyou for your order. it will be delivered by #{time}"
      )
  end

  private
  def time
    time = Time.now + (60 * 60)
    time.strftime("%H:%M")
  end
end
