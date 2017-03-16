require 'twilio-ruby'
class TwilioClient

  def initialize
    @SID = ENV['SID']
    @AUTH_TOK = ENV['AUTH_TOK']
    @TWIL_NUM = ENV['TWIL_NUM']
    @CUST_NUM = ENV['CUST_NUM']
    @client = Twilio::REST::Client.new(@SID,@AUTH_TOK)
  end

  def notify(body)
    @client.messages.create(
      from: @TWIL_NUM,
      to: @CUST_NUM,
      body: body
    )
  end

end
