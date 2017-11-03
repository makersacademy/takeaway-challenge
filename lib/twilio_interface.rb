require 'twilio-ruby'

class TwilioInterface

  attr_reader :client, :body, :message

# default_account_access_creds
  @account_sid = 'ENV'
  @auth_token = 'ENV'

  def initialize(account_sid = @account_sid, auth_token = @auth_token)
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def new_message(restaurant_number, customer_phone_number, body = "All in the game, yo")

    @message = @client.messages.create(
    :body => body,
    :to   => customer_phone_number,
    :from => restaurant_number)

  end

end
