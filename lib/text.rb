require 'twilio-ruby'
require 'dotenv'
Dotenv.load

module Text

  def send_text(text_content)
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    message = @client.account.messages.create(:body => text_content,
        :to => ENV['NUMBER'],
        :from => ENV['TWILIO'])
    puts message.sid
  end
end
