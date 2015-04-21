require 'twilio-ruby'
class TextConfirm
  def format_order order
    t = Time.new
    t += 3600
    @out_put = order.to_s + " expect delivery at #{t.strftime('%H:%M')}"
  end

  def send_order
    fail 'no order' unless @out_put
    account_sid = 'Dont want to put this on git hub'
    auth_token = 'abut it works in irb'
    @client = Twilio::REST::Client.new account_sid, auth_token
    hash = {
      from: '+lol',
      to: '+nice try',
      body: @out_put
    }
    @client.account.messages.create(hash)
  end
end