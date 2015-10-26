class SmsMessager

  def self.send_text(message_to_send)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(
        from: ENV['FROM_NUM'],
        to: ENV['TO_NUM'],
        body: message_to_send)
    message_to_send
  end


end
