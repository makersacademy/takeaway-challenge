require 'twilio-ruby'

class Messager
  attr_accessor :client
  
  def initialize(client_class = Twilio::REST::Client)
    @sid = ENV['TWILIO_SID']
    @token = ENV['TWILIO_TOKEN']
    @client_class = client_class
    @client = client_class.new(@sid, @token)
    @from = ENV['TWILIO_FROM']
  end

  def send_message(to, body)
    @client.messages.create(from: @from, to: to, body: body)
  end
end
