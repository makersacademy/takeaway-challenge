require 'base64'
require 'twilio-ruby'
require_relative 'confirmation_message'

class SMSService

  def initialize(confirmation_message_class: ConfirmationMessage, client: nil, number: nil)
    @confirmation_message_class = confirmation_message_class
    @sid = Base64.decode64("QUMzMDExMGE4OGJmOGMyY2RmODhhZmZhYmFmYzM4OTU1Mw==\n")
    @token = Base64.decode64("MTg5NWQzZmE3YWQ1ZWYzNzlhZWNiOWIyN2Q4NjYxMGE=\n")
    @client = client.nil? ? Twilio::REST::Client.new(@sid, @token) : client
    @number = number.nil? ? Base64.decode64("KzQ0IDI4IDk2OTIgODI4NQ==\n") : number
  end

  def send_sms
    message = create_message
    puts message.sid
  end

  def create_message
    confirmation_message = @confirmation_message_class.new.text
    @client.messages
      .create(
        body: confirmation_message,
        from:  @number,
        to:  @number
      )
  end

end
