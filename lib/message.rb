require 'twilio-ruby'

class Message
  attr_reader :account_sid, :auth_token,
              :client, :from, :to

  def initialize(client = Twilio::REST::Client.new(account_sid, auth_token))
    @account_sid = 'ACbad1cc1fe45037b01a7fd207fb7f270c'
    @auth_token = '2223f6422dca48314885d82d94b3d005'
    @client = client
    @from = '+447480485499' # Your Twilio number
    @to = '+447828166080' # Your mobile phone number
  end

  def send_message
    client.messages.create(
    from: from,
    to: to,
    body: "you've placed a takeaway order, it will arrive by #{Time.now + 60 * 30}"
    )
  end

end
