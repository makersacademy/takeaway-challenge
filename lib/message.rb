require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Message
  attr_reader :number, :msg_sent
  def initialize(number)
    @number = number
    @account_sid = ENV['TWI_API']
    @auth_token = ENV['TWI_AUTH']
    @from = ENV['TWI_NUM']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @msg_sent = false
  end

  def send_text(client = @client)
    client.account.messages.create(
      from: @from,
      to: @number,
      body: "Thank you for your order.  Your meal will be delivered by #{Time.now + 60 * 60}")
  end
end