class Messenger
  attr_reader :account_id, :account_auth

  def initialize
    @account_id = ENV['TWILIO_AC_ID']
    @account_auth = ENV['TWILIO_AUTH']
  end
end
