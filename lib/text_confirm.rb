require 'twilio-ruby'
class TextConfirm
  def format_order order
    t = Time.new
    t += 3600
    @out_put = order.to_s + " expect delivery at #{t.strftime('%H:%M')}"
  end

  def send_order
    fail 'no order' unless @out_put
    account_sid = 'ACd9ed4b40c19dac966a7235f209791907'
    auth_token = '3887cecd12717f7c6d8b4551313dcd98'
    @client = Twilio::REST::Client.new account_sid, auth_token
    hash = {
      from: '+441722241077',
      to: '+447530516234',
      body: @out_put
    }
    @client.account.messages.create(hash)
  end
end