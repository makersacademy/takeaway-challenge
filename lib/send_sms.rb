require 'twilio-ruby'

account_sid = '~'
auth_token = '~'

class SendSms

  def initialize(client = Twilio::REST::Client.new('~', '~'))
    @client = client
  end

  def send(message)

    @client.messages.create
    # (
    #      body: "#{message}. It will be delivered before #{Time.now + 3600}!",
    #      from: 'xxx',
    #      to: 'xxx'
    #    )
  end

end
