require 'twilio-ruby'

class TwilioClient

  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end
end
