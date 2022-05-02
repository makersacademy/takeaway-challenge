require 'twilio-ruby'
class Text
  def initialize(number, acc_sid, a_token)
    @time = Time.now + 3600
    @recipient_number = "#{number}"
    @account_sid = acc_sid
    @auth_token = a_token
  end

  def confirmation_text
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{@time.strftime("%H:%M")}",
        to: @recipient_number,
        from: "+15719462412")

    puts message.sid
  end
end