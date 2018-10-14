require 'base64'
require 'twilio-ruby'
require_relative 'confirmation_message'

class SMSService

  def initialize(number, confirmation_message_class: ConfirmationMessage,
      client: nil)
    @confirmation_message_class = confirmation_message_class
    @sid = Base64.decode64("QUMzMDk5MTczZWNjZGEyZDAzNTkyODJkM2NiZTJmNTlhNA==\n")
    @token = Base64.decode64("MTAwZTY5NzE4ODQxZjNlNTQ2MzUzYTE1YmYzMmU1MTk=\n")
    @client = client.nil? ? Twilio::REST::Client.new(@sid, @token) : client
    @number = number
  end

  def send_sms
    message = create_message
    message.sid
  end

  def create_message
    confirmation_message = @confirmation_message_class.new.text
    @client.messages
      .create(
        body: confirmation_message,
        from: Base64.decode64("KzQ0MTYxODUwMjA5Ng==\n"),
        to:  @number
      )
  end

end
