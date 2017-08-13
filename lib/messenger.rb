require 'twilio-ruby'

SID = "ACb8858d8748e24f9b4f20ab3fc9be476d"
AUTH_TOKEN = "37bc170517390470ee948f4793b3312a"

class Messenger
  def send_sms(body)
    @client = Twilio::REST::Client.new(SID, AUTH_TOKEN)
    message = @client.messages.create(body: body, to: "+447766703295", from: "+441494372685")
    message.sid
  end
end
