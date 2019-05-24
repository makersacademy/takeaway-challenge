require 'twilio-ruby'

class TextSender

  def initialize(time_class = Time, client_class = Twilio::REST::Client)
    @time = time_class.new
    @account_sid = ENV.fetch('TWILIO_ACCOUNT_SID')
    @auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')
    @client = client_class.new(@account_sid, @auth_token)
  end

  def send_message
    message = @client.messages.create(
                                 from: ENV.fetch('TWILIO_SEND_NUMBER'),
                                 body: generate_message_body,
                                 to: ENV.fetch('MOBILE_NUMBER')
                                 )
  end

  def generate_message_body
    "Thank you! Your order was placed and will be delivered before #{ @time.hour + 1 }:#{ @time.min }"
  end

end
