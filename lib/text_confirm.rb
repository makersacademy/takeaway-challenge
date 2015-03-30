require 'twilio-ruby'
class TextConfirm
  def format_order order
    @out_put = order.to_s + " expect delivery at #{(Time.now + 3600).strftime('%H:%M')}"
  end

  def send_order
    fail 'no order' unless @out_put
    account_sid = 'Dont want to put this on git hub'
    auth_token = 'but it works in irb'
    @client = Twilio::REST::Client.new account_sid, auth_token
    hash = {
      from: '+some number',
      to: '+to some number',
      body: @out_put
    }
    @client.account.messages.create(hash)
  end
end