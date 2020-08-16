require 'twilio-ruby'
  
class Text

  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @phone_number = ENV["PHONE_NUMBER"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_text(message)
    @client.messages.create(
      from: 447_445_349_962,
      to: @phone_number,
      body: message)
  end
end
