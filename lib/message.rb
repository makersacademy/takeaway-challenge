require 'twilio-ruby'

class Message

  def initialize(number, message)
    client = Twilio::REST::Client.new(
      ENV[],# need to create an account - account SID
      ENV[] # need to create account - auth token
    )

    client.message.create(
      from: "[07739981684]",
      to: "[#{number}]",
      body: "#{message}"
    )

  end

end
