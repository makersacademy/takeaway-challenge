require 'twilio-ruby'

class Message
  attr_reader :account_sid, :auth_token

  def initialize
    @account_sid = "AC0c335080db1f411ec0a91201a29743f1"
    @auth_token = "8f8e39564e1782d57d6eb144caa8f174"
  end

end
