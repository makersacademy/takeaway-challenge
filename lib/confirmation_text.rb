require 'twilio-ruby'
class ConfirmationText
  
  def initialize
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    
    @sender = ENV["TWILIO_NUMBER"]
    @receiver = ENV["MY_NUMBER"]
  end

  def send_message
    @client.messages.create(
        from: @sender,
        to: @receiver,
        body: "Thank you, your order will arrive before #{(Time.now + 3600).strftime("%k:%M")}"
    )
  end
end