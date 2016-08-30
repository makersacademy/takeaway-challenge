#understands how to send confirmation text to user.
require "twilio-ruby"
require "dotenv"
Dotenv.load

class Text

  ACCOUNT_SID = ENV['ACCOUNT_SID']
  AUTH_TOKEN = ENV['AUTH_TOKEN']

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def send
    @client.messages.create(
      :to => ENV["NUMBER"],
      :from => '+441613751649', #Twilio provided number
      :body => message
      )
  end

  private

  def message
    @time = Time.new + (60 * 60) #Current time plus 1 hour
    "Order confirmation. Thank you, your order has been placed and will arrive at #{@time.hour}:#{@time.min}."
  end

end
