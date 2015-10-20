require 'twilio-ruby'

class Text

  # account_sid = "ACe2ed22de6304098e2edb1f47a81b7f16"
  # auth_token = "7ebd86364d5152c6f45750eaffdeea7f"


attr_reader :sender, :client
  def initialize
    auth_token = "3888a13055563ec6138db93de2dbc84e"
    account_sid = "AC64fd75e684a62fb7b714e001da82bd21"
    @sender = "441604280198"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
  def send_text to, body
    @client.account.messages.create(
    body: body,
    to: to,
    from: sender,
    via: client)
  end
end
