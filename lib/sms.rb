require 'twilio-ruby'

class SMS

  def initialize
    account_sid = 'ACb887cc19fc9926f36fd0812f733c588a'
    auth_token = '587ed50f90c602532456b6088371d449'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    @client.account.messages.create(
      from: '+441926801014',
      to: '+447872900801',
      body: "Thank you! Your order was placed and will \
      be delivered before #{delivery_time}."
    )
  end

  private

  def delivery_time
    (Time.now + 3600).strftime('%H:%M')
  end

end
