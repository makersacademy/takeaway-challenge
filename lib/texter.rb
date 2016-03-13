require 'twilio-ruby'
require 'dotenv'

class Text

  def initialize
    @credentials = Dotenv.load
    @account_sid = @credentials['account_sid']
    @auth_token = @credentials['auth_token']
    @my_no = @credentials['my_no']
    @twilly_no = @credentials['twilly_no']

    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_message(message)
    confirmation(message)
  end

  private

  def confirmation(message)

  @message = @client.messages.create(
    to: @my_no,
    from: @twilly_no,
    body: message
    )
  end

end
