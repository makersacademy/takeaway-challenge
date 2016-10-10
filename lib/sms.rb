require 'rubygems'
require 'twilio-ruby'

class SMSConfirmation

  def initialize
    account_sid = 'AC6e70d6dcc83c097a6e913c3afbd424a3'
    auth_token = '901c21df552c5cfcf478c47b4aa310e3'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def sendsms(confirmation)
    @client.account.messages.create(
    from: '+441493202211',
    to: '+447759548193',
    body: confirmation
)
  end

end
