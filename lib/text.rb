require 'rubygems'
require 'twilio-ruby'
require_relative '../../.env.rb'

module Text

  def send_text(text_content)
    @client = Twilio::REST::Client.new ENV[:account_sid], ENV[:auth_token]

    message = @client.account.messages.create(:body => text_content,
        :to => ENV[:phone_number],
        :from => ENV[:twilio_number])
    puts message.sid
  end
end
