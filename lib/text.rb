require "dotenv"
Dotenv.load

class Text

  def initialize(client = Twilio::REST::Client, sid = ENV["TWILIO_SID"], key = ENV["TWILIO_KEY"])
    @client = client.new(sid, key)
  end

  def send(content)
    message = @client.messages.create(
        body: content,
        to: ENV["MY_NUMBER"],
        from: ENV["TWILIO_NUMBER"])
    puts message.sid
  end

end
