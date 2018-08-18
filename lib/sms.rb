require 'twilio-ruby'
require 'dotenv/load'

class Sms

  def initialize
    account_sid = ENV['"AC63e265e321d14d7abcc4d080a20be8db"']
    auth_token = ENV['"AC63e265e321d14d7abcc4d080a20be8db"']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
      message = @client.messages.create(
        body: "Thank you! Your order will be delivered by #{delivery_time}",
        to: "+447425275774",
        from: "+441344231763")
  end

  def delivery_time
    Time.now + 3600
  end

end
