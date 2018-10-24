require 'rubygems'
require 'twilio-ruby'
require_relative 'takeaway'

class Basket

  attr_reader :list
  attr_accessor :takeaway

  def initialize
    @list = []
  end

  def confirm_message

    one_hour = Time.now + 3600
    account_sid = "ACdf46dc1f7e113e8e29ceb5abb4a4aec1"
    auth_token = "9dd243ec6478fe50fc9a55e5f1b87e72"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Order confirmed! Your food will arrive at #{Time.now+3600}",
        to: "+447884236309",
        from: "+441570400012"
      )

    puts message.sid
  end
end
