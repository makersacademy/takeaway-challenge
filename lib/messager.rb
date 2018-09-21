require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Messager
  attr_reader :client, :to, :from

  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'],
             ENV['TWILIO_AUTH_TOKEN'])
    @to = ENV['NUM']
    @from = '+447449606023'
  end

  def send_message(message)
    client.messages.create(from: from, to: to, body: message)
  end
end
