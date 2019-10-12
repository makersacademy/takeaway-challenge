require 'twilio-ruby'

module OrderSMS

  def sms(client = Twilio::REST::Client)
    # put your own credentials here
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = client
    @client = client.new account_sid, auth_token

    # puts "Order placed!" if @order.complete?
    message = "Hi #{@order.customer.capitalize} your order has been Placed! It comes to £#{@order.total}. It will be delivered at #{Time.now + (45*60)}"
    @client.messages.create(
      from: "+15128618532",
      to: @order.number,
      body: message )
  end

end
