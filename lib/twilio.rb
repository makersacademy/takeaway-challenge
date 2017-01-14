require 'twilio-ruby'

module Send_Message

  private

  def send_text_message(message)
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]

    client = Twilio::REST::Client.new account_sid, auth_token

    client.account.sms.messages.create(
      :from => ENV["from"],
      :to => ENV["to"],
      :body => message)
  end
end
