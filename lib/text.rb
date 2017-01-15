require 'twilio-ruby'
require 'envyable'

class Text

  attr_reader :message

  def initialize
    Envyable.load('./config/env.yml', 'development')
    @message = 0
  end

  def send_message(total = 0)
    client_send(@message = generate_message(total))
    return @message
  end

private

  def generate_message(total = 0)
    "Thank you! Your order came to £#{total}. "\
    "You can expect your delivery at #{(Time.new + 3600).strftime('%I:%M%P')}"
    #reformat strftime
  end

  def client_send(message, client = Twilio::REST::Client)
    client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).account.messages.create(
    :body => @message,
    :to => "+447970670390",
    :from => "+441133205565")
  end
end
