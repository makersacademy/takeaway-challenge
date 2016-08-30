require 'rubygems'
require 'twilio-ruby'

module Twilio

  def send_sms(text)

    account_sid = "AC545e94e05844a9aa24633315996ef54e"
    auth_token = "724406237e1ad0ed6628ffd314d73839"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441359366024" # Your Twilio number

    friends = {
    "+4407734463803" => "Steve Dawes"
    }

    friends.each do |key, value|
      client.account.messages.create(
        :from => from,
        :to => key,
        :body => text
      )

    end

  end

end
