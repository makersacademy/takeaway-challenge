require 'twilio-ruby'

class Sendtext

  attr_reader :message, :client

  def initialize twillio_klass=Twilio::REST::Client, account_sid, auth_token
    @client = twillio_klass.new account_sid, auth_token



  end

  def send_message= message
    @message = message
    client.messages.create(message)
  end






end