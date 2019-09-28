require 'twilio-ruby'

class Messager
  
  attr_accessor :client
  
  def initialize(sid:, token:, client_class:)
    @sid = sid
    @token = token
    @client_class = client_class || Twilio::REST::Client
    @client = client_class.new(sid, token)
    @from = ENV['TWILIO_FROM']
  end

  def send_message(to, body)
    @client.messages.create(from: @from, to: to, body: body)
  end
end
