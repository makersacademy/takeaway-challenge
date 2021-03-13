require 'twilio-ruby'

# https://www.twilio.com/docs/libraries/ruby

# https://www.rubyguides.com/2019/01/ruby-environment-variables/

# To set up environmental variables, see http://twil.io/secure

class Messenger
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @twilio_no = ENV['TWILIO_NUMBER'] # Your Twilio number
    @user_no = ENV['USER_MOBILE'] # Your mobile phone number
  end

  def send_sms(msg)
    begin
      message = @client.messages.create(
      from: @twilio_no,
      to: @user_no,
      body: msg
      )
    rescue StandardError => e
      return e.message
    else
      return message.sid
    end
  end

end

puts Messenger.new.send_sms("let's try again")