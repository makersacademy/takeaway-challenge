require 'twilio-ruby'

class SMS

  attr_accessor :account_sid, :auth_token, :phone_number

  TIME_FORMAT = '%H:%M'

  def initialize(account_sid, auth_token, phone_number)
    @account_sid = account_sid
    @auth_token = auth_token
    @phone_number = phone_number
  end

  # def send_message
  #   client = Twilio::REST::Client.new(@account_sid, @auth_token)
  #   client.messages.create(
  #   from: '+12565769593',
  #   to: @phone_number,
  #   body: "Hey friend!"
  #   )
  # end

end