require 'twilio-ruby'
require 'date'
require 'dotenv'

class Messager
  def initialize
    @env = Dotenv.load
  end

  def send_text
    client = Twilio::REST::Client.new @env["account_sid"],@env["auth_token"]

    friends.each do |key, value|
      client.account.messages.create(
        from: @env[my_twilio_number],
        to: @env[my_number],
        body: "Thank you! Your order was placed and will be delivered before #{DateTime.now + (1/24.0)}"
        )
      puts "Sent message to #{value}"
    end
  end

end