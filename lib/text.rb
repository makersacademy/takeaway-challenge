require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  def send_text(text_content)
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    @client.messages.create(
      from: ENV['TWILIO'],
      to: ENV['NUMBER'],
      body: text_content)
  end
end
