require 'twilio-ruby'

module SMS
  def self.send(number) 
    client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])

    space = " " if (Time.now + 3600).hour >= 10
    time = (Time.now + 3600).strftime("%k:%M")

    client.messages.create(
    from: ENV["TWILIO_NUMBER"],
    to: number.to_s,
    body: "Your order was placed and will be delivered before#{space}#{time}"
    )
  end
end

# need to refactor this method into an initialize method
# need to add error message is SMS fails to send
# need to add success message if SMS sends
