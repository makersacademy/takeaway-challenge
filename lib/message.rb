require 'rubygems'
require 'twilio-ruby'

class Message
  def initialize
    @client = Twilio::REST::Client.new(
        ENV['TWILIO_SID'],
        ENV['TWILIO_TOKEN']
      )
  end
  def send_message(msg)
    twilio_number = ENV['TWILIO_NUMBER']
    client_number = ENV['IRYNA_NUMBER']

    message = @client.account.messages.create(
      :body => msg,
      :to => client_number,
      :from => twilio_number)
    msg
  end
end