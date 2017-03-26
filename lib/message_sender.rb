require 'twilio-ruby'
require_relative 'sensitive_info'
class MessageSender

  attr_reader :client

  def initialize
    @account_sid = SensitiveInfo::ACCOUNT_SID
    @auth_token= SensitiveInfo::AUTH_TOKEN
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_message(text)

    from = SensitiveInfo::FROM
    to  = SensitiveInfo::TO

    message = client.account.messages.create(
      {
        :from => from,
        :to => to,
        :body => text
      }
    )

  end
  private


end
