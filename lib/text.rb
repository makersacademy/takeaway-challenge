require 'rubygems'
require 'twilio-ruby'
require_relative '../../.env.rb'

module Text

  def send_text
    @client = Twilio::REST::Client.new ENV[:account_sid], ENV[:auth_token]

    message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before 17:35",
        :to => ENV[:phone_number],
        :from => ENV[:twilio_number])
    puts message.sid
  end

end
