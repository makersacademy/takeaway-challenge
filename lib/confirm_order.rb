require 'twilio-ruby'

class ConfirmOrder
  
  def confirm_order
    # Your Account SID from www.twilio.com/console
    account_sid = "AC0669ddc0d4125dde1e1f39d69ae96c44"
    # Your Auth Token from www.twilio.com/console
    auth_token = "48bf7fd23a639672b3693db1233ba5c4"
    time_order_will_arrive = Time.now + 2700

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before
        #{time_order_will_arrive.hour}:#{time_order_will_arrive.min}",
        to: "+447787172322",    # Replace with your phone number
        from: "+447449763947")  # Replace with your Twilio number
  end
end
#puts message.sid
