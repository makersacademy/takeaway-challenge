require 'twilio-ruby'
require 'dotenv'
Dotenv.load

module Send_Message

  private

  def send_text_message(message)
    client = Twilio::REST::Client.new ENV["account_sid"], ENV["auth_token"]

    client.account.sms.messages.create(
      :from => ENV["from"],
      :to => ENV["to"],
      :body => message)
  end
end
