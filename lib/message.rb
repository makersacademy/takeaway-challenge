require 'twilio-ruby'

class Message
  attr_reader :from, :to, :body

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  
  TWILIO_NUM = ENV['TWILIO_NUM']
  MY_NUM = ENV['MY_NUM']

  def initialize(string, num_to = MY_NUM, num_from = TWILIO_NUM)
    @from = num_from
    @to = num_to
    @body = string
  end

  def send
    @client.messages.create(
      from: @from,
      to: @to,
      body: @body
    )
  end

end
