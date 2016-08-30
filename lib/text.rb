#understands how to send confirmation text to user.
require "twilio-ruby"
require "dotenv"
Dotenv.load

class Text

  def initialize(twilio_client = Twilio::REST::Client)
    @client = twilio_client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
  end

  def send
    @client.messages.create(
      :to => ENV["NUMBER"],
      :from => '+447481344824', #Twilio provided number
      :body => message
      )
  end

  private

  def message
    @time = Time.new + (60 * 60) #Current time plus 1 hour
    "Order confirmation. Thank you, your order has been placed and will arrive at #{@time.hour}:#{@time.min}."
  end

end
