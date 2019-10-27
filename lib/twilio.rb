require 'twilio-ruby'

class SMS

attr_reader :credentials

  def initialize(credentials)
    @credentials = credentials
    @client = Twilio::REST::Client.new(@credentials["AC440a2d99f87bc601c3061a527531410d"], @credentials["6110803450b022f8e78ce221ab076a87"])
  end

  def set_credentials(credentials)
    @credientials = credentials
  end

  def send_sms(message)
    @client.messages.create(
      from: credentials["+13342698973"],
      to: number["+447447663239"],
      body: message
    )
  end
end
