require 'bundler'
Bundler.require()

class Confirmation

  def send
    twilio
    time = Time.now
    @client.messages.create(
    to: "+447535011832",
    from: "+447492889068",
    body: "Thank you! Your order was placed and will be delivered before #{time.hour+1}:#{time.min}"
    )
  end

  private

  def twilio
    account_sid = "AC10fd3faa78a3d63a02326e48229577f1"
    auth_token = "455568101452ba91849052c8147480d4"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

end
