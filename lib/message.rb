require 'twilio-ruby'

class Message
  attr_reader :from, :to, :body

  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  TWILIO_NUM = ENV['TWILIO_NUM']
  MY_NUM = ENV['MY_NUM']
  DEFAULT_MESSAGE = "Thanks for your order. It will be with you within one hour"

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def draft(string = DEFAULT_MESSAGE, to = MY_NUM, from = TWILIO_NUM)
    @from = from
    @to = to
    @body = string 
    "Draft Created"
  end

  def send
    @client.messages.create(
      from: @from,
      to: @to,
      body: @body
    )
    "Sent"
  end

end
