require 'bundler'

Bundler.require()

class Text
  attr_reader :client

  ACCOUNT_SID = "AC9f87b9e0a7c45431cbb48726a53b9637"
  AUTH_TOKEN = "1cdf8a1d4d9a3e8f1a38ae702597e386"

  def initialize
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def send_sms(message)
    client.messages.create(
    to: "+447888334605",
    from: "+441158245401",
    body: message
    )
  end
end
