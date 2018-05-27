require "twilio-ruby"

class SmsConfirmationClient
  def initialize(
      account_sid:, auth_token:, sender_num:, recipient_num:
    )
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @sender_num = sender_num
    @recipient_num = recipient_num
  end

  def send_sms(message)
    @client.api.account.messages.create(
      from: @sender_num,
      to: @recipient_num,
      body: message
    )
  end
end
