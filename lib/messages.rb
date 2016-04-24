class Messages
  require 'twilio-ruby'
  SID = "AC28311533392e3cb81b6417d38bca4554".freeze
  TOKEN = "7da5ff9f79b81398aa379e1e24340c6a".freeze

  def initialize(from = "+16572206632", account_sid = SID, auth_token = TOKEN)
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from =  from
    current = Time.now
    @t = format('%d:%02d', current.hour + 1, current.min)
  end

  def send_message
    m = "Thank you! Your order was placed and will be delivered before #{@t}"
    @client.account.messages.create(from: @from, to: +1_562_631_721_6, body: m)
    "Sent message to Nick"
  end
end
