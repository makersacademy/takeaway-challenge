require 'twilio-ruby'

class Texter
  def send_message message, customer_no
    client = Twilio::REST::Client.new ENV['SID'], ENV['AUTH']
    client.account.messages.create from: 441227641114, to: customer_no, body: message
  end
end
