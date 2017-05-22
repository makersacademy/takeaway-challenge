require 'twilio-ruby'
require 'time'
require 'dotenv'
Dotenv.load


class SMS

  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new(account_sid = ENV['TWILIO_SID'], auth_token = ENV['TWILIO_TOKEN'])
  end

  def send_message
    message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}\n",
      :to => ENV['TWILIO_TO'],    # Replace with your phone number
      :from => ENV['TWILIO_FROM'])  # Replace with your Twilio number
    puts message.sid
  end

end
