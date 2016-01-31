require 'twilio-ruby'
require 'dotenv'

module Text

  Dotenv.load

  def text_confirmation(body)
    setup
    @client.messages.create(
    from: ENV['TWILIO_FROM_NUMBER'],
    to: ENV['TWILIO_TO_NUMBER'],
    body: body
    )
  end

  private

  def setup
    set_sid
    set_token
    set_client
  end

  def set_client
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def set_sid
    @account_sid = ENV['TWILIO_SID']
  end

  def set_token
    @auth_token = ENV['TWILIO_TOKEN']
  end

end
