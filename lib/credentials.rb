require 'dotenv/load'

class Credentials

  attr_reader :account_id, :auth_token

  def initialize
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @account_id = ENV['TWILIO_ACCOUNT_SID']  
  end

end
