require 'twilio-ruby'

class Message

  def send
    Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
      .messages.create(
        from: ENV["TWILIO_FROM"],
        to: ENV["TWILIO_TO"],
        body: "Thank you! Your order was placed and will be delivered before #{time_in_an_hour}"
      )

    "Sent"
  end

  private 

  def time_in_an_hour
    t = Time.now + (60 * 60)
    t.strftime("%H:%M") 
  end

end
