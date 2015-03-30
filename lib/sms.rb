require 'twilio-ruby'
require_relative 'keys'

module Sms
  def self.send(tel, message)
    Sms.configure_twilio
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: '+441422653179',
      to: tel,
      body: message
    )
  end

  private

  def self.configure_twilio
    account_sid = Keys::ACCOUNT_SID
    auth_token = Keys::AUTH_TOKEN

    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end
  end
end

