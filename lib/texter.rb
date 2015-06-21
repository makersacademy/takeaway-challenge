require 'twilio-ruby'
require '/.env.rb'

class Texter
  def send_message message, customer_no
    client = Twilio::REST::Client.new ENV['sid'], ENV['auth']
    client.account.messages.create from: 441227641114, to: customer_no, body: message
  end
end
