require 'csv'
require 'twilio-ruby'

class Texter

  def initialize(message)
    auth = CSV.read('./lib/auth.csv')
    @sid = auth[0][0]
    @token = auth[0][1]
    @to = auth[0][2]
    @from = auth[0][3]
    @message = message
  end

  def sendtext
    # @client = Twilio::REST::Client.new @sid, @token
    # @client.messages.create(
    #     body: @message,
    #     to: @to,
    #     from: @from)
    puts "Text sent!"
    return true
  end
end
