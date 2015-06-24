require 'twilio-ruby'

class TextSender


  def initialize

    @client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']

  end


  def submit_text

    delivery_time = Time.new + 3600

    @client.messages.create(
    from: '+441242305328',
    to: '+447472301963',
    body: "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime('%H:%M')}"
    )

  end

end
