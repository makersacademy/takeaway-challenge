require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class TwilioSMS

  def initialize( sms_messenger: Twilio::REST::Client.new((ENV['ACCOUNT_SID']), (ENV['AUTH_TOKEN'])))
    @sms_messenger = sms_messenger
  end

  def send_sms(message)
    from=ENV["TWILIONO"]
    @sms_messenger.account.messages.create(
    :from => from,
    :to => ENV["MY_NUMBER"],
    :body => message
    )
  end

end