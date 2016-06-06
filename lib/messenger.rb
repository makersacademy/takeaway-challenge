class Messenger

  require 'twilio-ruby'
  require_relative 'private_info.rb'

  def initialize
    account_sid = PrivateInfo::SID
    auth_token = PrivateInfo::TOKEN
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send
    @client.account.messages.create({
    :from => PrivateInfo::FROM,
    :to => PrivateInfo::TO,
    :body =>
    "Order received. Estimated delivery_time #{delivery_time}. Thank you."
    })
  end

  private

  def delivery_time
    (Time.now + 3600).strftime("%H:%M")
  end

end

Messenger.new.send
