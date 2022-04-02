require 'twilio-ruby'

class SendSms
  attr_reader :text_message

  def initialize(message)
    @text_message = message
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']

    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      to: ENV['my_phone'],
      from: '+447380318009',
      body: @text_message
    )
  end

end
