require 'dotenv'
Dotenv.load

module Credentials

  def self.acc_sid
    ENV['ACCOUNT_SID']
  end

  def self.auth_token
    ENV['AUTH_TOKEN']
  end

  def self.sender
    ENV['SENDER_NUMBER']
  end
end
