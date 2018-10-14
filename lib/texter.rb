require 'dotenv/load'
require 'twilio-ruby'

class Texter
  SID = ENV['SID']
  AUTH_TOKEN = ENV['AUTH_TOKEN']
  CLIENT = Twilio::REST::Client.new(SID, AUTH_TOKEN)
  NUMBER_FROM = '+441212851936'
  NUMBER_TO = '+447702025165'

  def initialize(client = CLIENT, from = NUMBER_FROM, to = NUMBER_TO)
    @client = client
    @from = from
    @to = to
  end

  def send(message)
    @client.messages.create(
    from: @from,
    to: @to,
    body: message
    )
  end
end
