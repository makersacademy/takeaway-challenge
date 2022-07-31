require 'dotenv/load'
require 'twilio-ruby'

class Text
  def initialize
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = ENV['FROM']
    @to = ENV['TO']
  end

  def send_text(message)

    @client.messages.create(
      from: @from,
      to: @to,
      body: message
    )
  end
end
