require 'twilio-ruby'
require_relative 'takeaway'

class Text

  def initialize
    account_sid = "AC6b063f16ec87ea56aac9114c6e4416d0"
    auth_token =
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(message)
    @client.message.create(
      body: message,
      from: '',
      to: ''
    )
  end

end
