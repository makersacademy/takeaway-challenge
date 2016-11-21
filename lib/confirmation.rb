require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class Confirmation
  attr_reader :account

  def initialize
    account_sid = 'ACa2a3c5def88970d08a87bc3e637e7d20'
    auth_token = '1c65438a0ef417767069b5acbd848f70'
    @account = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation(phone_number)
    time = Time.new + (60 * 60)
    @account.messages.create(
      from: '+442033223757',
      to: phone_number,
      body: "Your food is being cooked and will be delivered at #{time.strftime('%H:%M')}."
    )
  end

end
