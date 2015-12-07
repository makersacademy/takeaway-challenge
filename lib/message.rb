require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Message

  def initialize
    @client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
  end

  def send
    @message = @client.messages.create(
      to: ENV['text_to'],
      from: ENV['text_from'],
      body: send_message
    )
  end

  private

    def send_message
      "Thank you! Your order was placed \
       and will be delivered before #{time_in_one_hour}"
    end

    def time_in_one_hour
      (Time.now + 60*60).strftime("%H:%M")
    end

end
