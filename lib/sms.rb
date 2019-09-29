require 'twilio-ruby'

module OrderSMS

  def sms
    # put your own credentials here
    account_sid = 'AC7dee7f0fdaf9e1fd50bb5111a8433f09'
    auth_token = '1f06ec6b2ae24f3857990a0cbff0cdca'
    @client = Twilio::REST::Client.new account_sid, auth_token

    puts "Order placed!" if @order.complete?
    message = "Hi #{@order.customer.capitalize} your order has been Placed! It comes to £#{@order.total}. It will be delivered at #{Time.now + (45*60)}"
    @client.messages.create(
      from: "+15128618532",
      to: @order.number,
      body: message )
  end

end
