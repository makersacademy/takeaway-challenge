require 'twilio-ruby'
require 'dotenv'

class SMSSender

  def send_message(message)

    Dotenv.load
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]
    twilio_number = ENV["twilio_number"]
    customer_number = ENV["phone_number"]

      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.account.messages.create(:body => message,
            :to => customer_number,
            :from => twilio_number)
  end

end
