require 'twilio-ruby'

class TwilioMessenger

  ACCOUNT_SID = 'AC28b49fe674fe72904e325b4618b00b0d'.freeze
  AUTH_TOKEN = 'b5d1fff7bce062a9b3241607df33c621'.freeze
  FROM = "+61400106715".freeze

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def send_message(number)
    client.account.messages.create(body: body, to: number, from: FROM)
  end

  private

  attr_reader :client

  def body
    "Thank you! Your order will be delivered before " + delivery_time
  end

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

end