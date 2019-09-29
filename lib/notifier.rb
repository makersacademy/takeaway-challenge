require 'twilio-ruby'

class Notifier

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV['FROM']
    @to = ENV['TO']
  end

  def send_message(txt)
    @client.messages.create(
    from: @from,
    to: @to,
    body: txt
    )
  end
end
