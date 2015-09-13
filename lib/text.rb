
require 'twilio-ruby'

# account_sid = "ACe2ed22de6304098e2edb1f47a81b7f16"
# auth_token = "7ebd86364d5152c6f45750eaffdeea7f"
# client = Twilio::REST::Client.new account_sid, auth_tok
# from "441604280198"

class Text

  def initialize
  account_sid = "ACe2ed22de6304098e2edb1f47a81b7f16"
  auth_token = "7ebd86364d5152c6f45750eaffdeea7f"
  @client = Twilio::REST::Client.new account_sid, auth_token
  @sender = "441604280198"


  def send_text(to,body)
    @client.account.messages.create(
    body: body,
    to: to,
    from: sender,
    via: client)
    end

  end





end
