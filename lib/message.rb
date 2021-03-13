require 'twilio-ruby'

class Message
  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def message(phone_number)
    begin
      message = @client.messages.create(
          body: "Your order is being processed you can expecte delivery at #{time}",
          to: phone_number,
          from: ENV['ACCOUNT_NUMBER'])
    rescue Twilio::REST::TwilioError => e
      puts e.message
    end
  end
end
