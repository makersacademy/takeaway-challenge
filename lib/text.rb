require "twilio-ruby"

class Text
  attr_reader :number
  ACCOUNT_SID = "ACb0f883392af30d46dcae4f3e2b241e85"
  AUTH_TOKEN = "774c327b43486b176146c34bf50de46c"
  TWILIO_NUM = "+441502797121"

  def initialize(phone_number)
    @number = phone_number
  end

  def send
    client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    client.messages.create(
      to: number,
      from: TWILIO_NUM,
      body: "Hello there!"
    )
  end
end
