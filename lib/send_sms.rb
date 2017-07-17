require 'twilio-ruby'
require 'dotenv'

class Text
  def send_text(message)
    Dotenv.load('config.env')
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.api.account.messages.create(
      from: ENV['FROM'],
      to: ENV['TO'],
      body: "#{message}"
    )
  end
end
