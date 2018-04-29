class Messenger
  attr_reader :account_sid, :auth_token

  def initialize
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
  end
end
