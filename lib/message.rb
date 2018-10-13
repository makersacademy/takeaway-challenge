require 'twilio-ruby'

class Message
  attr_reader :account_sid, :auth_token

  def initialize(client: Twilio::REST::Client.new(
    "AC0c335080db1f411ec0a91201a29743f1",
    "8f8e39564e1782d57d6eb144caa8f174").messages)

    @client = client
  end

  def send
    @client.create(
      body: "Thank you for your order! It will be arriving shortly",
      to: "+447539225381",
      from: "+441133205022"
    )
  end
end
