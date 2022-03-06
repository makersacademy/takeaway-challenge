require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class TextMessage

  @@account_sid = ENV['ACCOUNT_SID']
  @@auth_token = ENV['AUTH_TOKEN']

  def initialize(client = Twilio::REST::Client.new(@@account_sid, @@auth_token))
    @client = client
  end

end
