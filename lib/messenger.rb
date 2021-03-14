require 'twilio-ruby'

class Messenger
  attr_reader :sent, :log

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @twilio_no = ENV['TWILIO_NUMBER'] # Your Twilio number
    # @user_no = ENV['USER_MOBILE'] # Your mobile phone number
    @sent = false
    @log = ""
  end

  def send_sms(user_number, msg)
    begin
      message = @client.messages.create(
      from: @twilio_no,
      to: user_number,
      body: msg
      )
    rescue StandardError => e
      @log = e.message
    else
      @sent = true
      @log = message.sid
    end
  end
end
