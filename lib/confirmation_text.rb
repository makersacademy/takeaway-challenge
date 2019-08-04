# require 'twilio-ruby'

class ConfirmationText

  attr_reader :time,

  def initialize
    @time = Time.now + 3600
  end

  def send_text
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
                               body: "Thank you! Your order was placed and will be delivered before #{@time.strftime("%k:%M")}",
                               from: ENV["TWILIO_NUMBER"],
                               to: ENV["PHONE_NUMBER"]
                                      )
    puts message.sid
  end

end
