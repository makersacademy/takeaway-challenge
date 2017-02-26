require 'twilio-ruby'

class NotifyCustomer

  attr_reader :AUTH_TOK, :SID, :TWIL_NUM, :CUST_NUM, :client

  # def send_sms
  #   account_sid = "{{ ACef0738703128586688f472cc31e9c440 }}"
  #   auth_token = "{{ 2db2d2c86e060228a4546eb81d3a2912 }}"
  #
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #   message = @client.account.messages.create(:body => "Hello from Ruby",
  #   :to => "+447763611835",
  #   :from => "+441277420398")
  #
  #   puts message.sid
  #
  #   # rescue Twilio::REST::RequestError => e
  #   #   puts e.message
  #   end

  def initialize
    @SID = ENV['ACef0738703128586688f472cc31e9c440']
    @AUTH_TOK = ENV['2db2d2c86e060228a4546eb81d3a2912']
    @TWIL_NUM = ENV['+441277420398']
    @CUST_NUM = ENV['+447763611835']
    @client = Twilio::REST::Client.new(@SID,@AUTH_TOK)
    @body = 'test message'
  end

  def send_sms(body=@body)
    @client.messages.create(
    from: @TWIL_NUM,
    to: @CUST_NUM,
    body: body
    )
  end
end
