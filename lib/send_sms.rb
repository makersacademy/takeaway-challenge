require 'rubygems'
require 'twilio-ruby'
require 'dotenv'

module SMS

  def send_confirmation_sms number, message
    Dotenv.load
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    twilio_no = "+441548312031"

    client.account.messages.create(
      :from => twilio_no,
      :to => number,
      :body => message
    )
  end

end
