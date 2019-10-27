require 'twilio-ruby'

class SMS
  def initialize(credentials)
    @credentials = credentials
    @client = Twilio::REST::Client.new(@credentials["sid"], @credentials["auth_token"])
  end

  def set_credentials(credentials)
    @credientials = credentials
  end

  def send_sms(body, number)
    @client.messages.create(
      from: @credentials["number"],
      to: number,
      body: body
    )
  end
end
