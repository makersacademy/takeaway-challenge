require 'twilio-ruby'

class Texter
  SID = 'ACf932e8a2e569785f9bc034f45520df0d'
  AUTH_TOKEN = 'fb04b90afacb477abe4085deb8482c8a'
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
