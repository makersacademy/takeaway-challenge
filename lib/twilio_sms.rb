require './lib/telinfo'
require 'twilio-ruby'

class Telephone
  include TelInfo

  def initialize
    @client = Twilio::REST::Client.new SID, TOKEN
  end

  def send_sms(to, body)
    @client.api.account.messages.create(
      from: TAKEAWAYTEL,
      to: to,
      body: body
      )
  end
end
