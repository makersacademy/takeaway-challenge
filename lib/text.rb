#understands how to send confirmation text to user.
require "twilio-ruby"

class Text

  account_sid = 'AC2723fb5c4f19b473c1f85cefc11d2725'
  auth_token = 'd35887688b544de66778208213323523'

  @client = Twilio::REST::Client.new account_sid, auth_token

  def send
    @client.account.messages.create({
      :to => ENV["TWILIO_TEXT_NUMBER"],
      :from => '+441613751649', #Twilio provided number
      :body => message,
      })
  end

  private

  def message
    @time = Time.new + (60 * 60) #Current time plus 1 hour
    "Order confirmation. Thank you, your order has been placed and will arrive at #{@time.hour}:#{@time.min}."
  end

end
