require 'twilio-ruby'

class Confirmation

  attr_reader :order_confirmation

  def send_confirmation_text
    @order_confirmation = Time.now + (60*60)

    account_sid = 'AC46cd4d3c87da74f0701cdb13e4dc01e8'
    auth_token = '87a904bfbbd5a007fdb14ca10c6b8864'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+4407568571586",
      from: "+441384901110",
      body: "Your order will be arriving at #{@order_confirmation}"
    )
  end
end