require "dotenv"
Dotenv.load

class Text

  AUTH = "AC86dc289721e21ddbdad9b772ba094d37"
  KEY = "72dc6dafc62c0187a3ea45406e3aeeeb"

  def initialize(client = Twilio::REST::Client)
    @client = client.new(ENV["TWILIO_SID"], ENV["TWILIO_KEY"])
  end

  def send(content)
    message = @client.messages.create(
        body: content,
        to: ENV["MY_NUMBER"],
        from: ENV["TWILIO_NUMBER"])
    puts message.sid
  end

end
