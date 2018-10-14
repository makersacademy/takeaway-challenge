require 'twilio-ruby'

class Text

  ACCOUNT_SID = 'ACc68fbb7c5f4b5a7c5bb1a06faaab901d'
  AUTH_TOKEN = '4e5bdc58fcc22d2b586f396a43288263'

  def initialize(number = '+441785472436', client_number = '+447478158606', object = Object)
    @twilio_phone_number = number
    @client_number = client_number
    @object = object
  end

  def text
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @client.messages.create(
      from: @twilio_phone_number,
      to: @client_number,
      body: "Your order was placed. It will be delivered before #{Time.now + 3600}"
    )
  end

end
