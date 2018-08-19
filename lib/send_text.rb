require_relative './../config.rb'
require 'twilio-ruby'

class Message

  def initialize
    # put your own credentials here
    account_sid = Config::ACCOUNT_SID
    auth_token = Config::AUTH_TOKEN
    @twilio_num = Config::TWILIO_NUMBER
    @my_num = Config::MY_NUMBER
    @body_message = Config::MESSAGE

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
      message = @client.messages.create(
      from: Config::TWILIO_NUMBER,
      to: Config::MY_NUMBER,
      body: Config::MESSAGE + "#{time_sent.strftime('%I:%M%P')}"
      )
  end

  def time_sent
    Time.new + 1800
  end
end
