require 'twilio-ruby'
require 'dotenv'

class Messenger


  def send(message)

    Dotenv.load
        account_sid = ENV["TWILIO_ACCOUNT_SID"]
        auth_token = ENV["TWILIO_AUTH_TOKEN"]
        twilio_number = ENV["TWILIO_NUMBER"]
        customer_number = ENV["CUSTOMER_NUMBER"]

        @client = Twilio::REST::Client.new(account_sid, auth_token)

        @client.account.messages.create(:body => message,
            :to => customer_number,
            :from => twilio_number)
  end

end
