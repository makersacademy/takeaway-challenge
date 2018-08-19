require 'twilio-ruby'
class SMS

  def initialize
    account_sid = 'AC9c21a11caf4a1045f79f695742aae881'
    auth_token  = 'a2669f5218a3e8f29703184280a528f7'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_msg
    from = '+442476100950'
    to = '+447596529149'
    @client.messages.create(
      from: from,
      to: to,
      body: "your order will arrive at #{Time.now.hour + 1}:#{Time.now.min}"
    )
  end

end
#
# require 'twilio-ruby'
#
# account_sid = 'AC9c21a11caf4a1045f79f695742aae881'
# auth_token = 'a2669f5218a3e8f29703184280a528f7'
# client = Twilio::REST::Client.new(account_sid, auth_token)
#
# from = '+442476100950' # Your Twilio number
# to = '+447596529149' # Your mobile phone number
#
# client.messages.create(
# from: from,
# to: to,
# body: "Hey friend!"
# )


  # def send_delivery_notification
  #   @order.status = :dropped_off
  #   if @order.save
  #     message = 'Your laundry is arriving now.'
  #     notify(message)
  #   else
  #     redirect_with_error
  #   end
  # end

# end
