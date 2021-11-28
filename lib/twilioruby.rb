require 'twilio-ruby'
require 'env'

class SendMeAText

  def initialize(client = Twilio::REST::Client, sid = ENV['account_sid'], auth = ENV['auth_token'])
    @account_sid = sid
    @auth_token = auth
    @client = client.new(@account_sid, @auth_token)
  end

  def send_text(order)
    arrival_time = (Time.now + 60 * 60).strftime('%H:%M').to_s
    body_new = "Your order of #{order} has been confirmed! It will arrive at" + arrival_time
    @client.messages.create(
      from: '+447701411975',
    to: '+447950670430',
    body: body_new)
  end

end
