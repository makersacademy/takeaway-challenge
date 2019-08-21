require 'twilio-ruby'
require 'time'

class Text
  def initialize(time = Time.now)
    @time = time
    @eta = (time + 3600).to_s[11..15]
  end

  def client_info
    account_sid = ''
    auth_token = ''
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text
    @client.api.account.messages.create(
    from: '',
    to: '',
    body: "Thanks for your order from Sam's pizza! Your food will be delivered before #{@eta}."
    )
  end

end
