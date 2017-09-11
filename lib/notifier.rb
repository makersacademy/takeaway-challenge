require 'dotenv/load'
require 'twilio-ruby'

class Notifier

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token  = ENV['AUTH_TOKEN']
    @client     = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message(message_body)
    @client.account.messages.create(:body => "#{message_body}",
      :to => ENV['TO_NUMBER'],
      :from => ENV['FROM_NUMBER'])
  end

end
