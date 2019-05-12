require 'twilio-ruby'
require 'time'

class Text
  def initialize(time = Time.now)
    @time = time
    @eta = (time + 3600).to_s[11..15]
  end

  def client_info
    account_sid = 'AC40c976076aa2c78402839fe533990f9f'
    auth_token = '9ce7df56bf7307cbf531263b2ac8acb8'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text
    @client.api.account.messages.create(
    from: '+447723429606',
    to: '+447540624339',
    body: "Thanks for your order from Sam's pizza! Your food will be delivered before #{@eta}."
    )
  end

end
